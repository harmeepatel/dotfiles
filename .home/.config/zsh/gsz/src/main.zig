const std = @import("std");
const root = @import("root.zig");
const debug = std.log.debug;
const stdout = std.io.getStdOut().writer();
const hash = std.hash.Wyhash.hash;

const BUF_SIZE = 128 * 128;

fn addStyle(alloc: std.mem.Allocator, col: u8) []const u8 {
    return std.fmt.allocPrint(alloc, "%F{{{}}}", .{col}) catch "";
}

pub fn main() !void {
    // command
    const git_status_cmd = [_][]const u8{ "git", "status", "-s" };

    // allocator
    var buf: [1 << 14]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    const allocator = fba.allocator();
    defer allocator.free(&buf);

    // process
    var process = std.process.Child.init(&git_status_cmd, allocator);
    process.stdout_behavior = .Pipe;
    process.stderr_behavior = .Pipe;
    try process.spawn();
    defer _ = process.kill() catch {};

    // exit early if `git status` exits with an error
    const err = try process.stderr.?.readToEndAlloc(allocator, BUF_SIZE);
    if (err.len > 0) {
        try stdout.print("", .{});
        std.process.exit(0);
    }

    // stdout
    const out = try process.stdout.?.readToEndAlloc(allocator, BUF_SIZE);
    defer allocator.free(out);

    if (out.len == 0) {
        try stdout.print("", .{});
        std.process.exit(0);
    }

    // status map
    var gs = std.StringHashMap(u8).init(allocator);
    defer gs.deinit();

    var line_split = std.mem.splitScalar(u8, out, '\n');
    while (line_split.next()) |line| {
        if (line.len == 0) {
            continue;
        }
        const status_split = std.mem.trim(u8, line[0..3], " ");
        const status = try gs.getOrPut(status_split);

        if (status.found_existing) {
            status.value_ptr.* += 1;
        } else {
            status.value_ptr.* = 1;
        }
    }

    // constructing output
    var i: u16 = 0;
    var it = gs.iterator();
    const color_delete = 1;
    const color_modified = 2;
    const color_untracked = 4;
    stdout.print(" %f[", .{}) catch {}; // reset color before
    defer stdout.print("%f]", .{}) catch {}; // reset color after
    while (it.next()) |entry| : (i += 1) {
        const col = switch (hash(0, entry.key_ptr.*)) {
            hash(0, "D") => addStyle(allocator, color_delete),
            hash(0, "M") => addStyle(allocator, color_modified),
            hash(0, "??") => addStyle(allocator, color_untracked),
            else => addStyle(allocator, 0),
        };
        defer allocator.free(col);
        try stdout.print("{s}{d}{s}", .{ col, entry.value_ptr.*, entry.key_ptr.* });
        if (i < gs.unmanaged.size - 1) {
            try stdout.print(" ", .{});
        }
    }
}
