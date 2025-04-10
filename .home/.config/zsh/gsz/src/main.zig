const std = @import("std");
const root = @import("root.zig");
const print = std.debug.print;
const stdout = std.io.getStdOut().writer();
const hash = std.hash.Wyhash.hash;

const BUF_SIZE = 128 * 128;

fn rgbFromHex(hex_code: []const u8) [3]u32 {
    const user_hex = if (hex_code[0] == '#') hex_code[1..] else hex_code;
    const hex_final = if (user_hex.len == 3) &[_]u8{ user_hex[0], user_hex[0], user_hex[1], user_hex[1], user_hex[2], user_hex[2] } else user_hex;
    const hex_int = std.fmt.parseInt(u32, hex_final, 16) catch 0;
    return [_]u32{
        (hex_int >> 16) & 0xFF, // red
        (hex_int >> 8) & 0xFF, // green
        hex_int & 0xFF, // blue
    };
}

fn wrapAnsi16m(alloc: std.mem.Allocator, rgb: [3]u32) []const u8 {
    return std.fmt.allocPrint(alloc, "\u{001B}[38;2;{};{};{};m", .{ rgb[0], rgb[1], rgb[2] }) catch "";
}

pub fn main() !void {
    // command
    const git_status_cmd = [_][]const u8{ "git", "status", "-s" };

    // allocator
    var gpa: std.heap.DebugAllocator(.{}) = .init;
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

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

    var i: u16 = 0;
    var it = gs.iterator();
    const color_delete = "#ff6637";
    const color_modified = "#ffaa24";
    const color_untracked = "#7788ff";
    while (it.next()) |entry| : (i += 1) {
        const col = switch (hash(0, entry.key_ptr.*)) {
            hash(0, "D") => wrapAnsi16m(allocator, rgbFromHex(color_delete)),
            hash(0, "M") => wrapAnsi16m(allocator, rgbFromHex(color_modified)),
            hash(0, "??") => wrapAnsi16m(allocator, rgbFromHex(color_untracked)),
            else => "#fefefe",
        };
        defer allocator.free(col);
        try stdout.print("{s}\u{001B}[1m{d}{s}\u{001B}[22m", .{ col, entry.value_ptr.*, entry.key_ptr.* });
        if (i < gs.unmanaged.size - 1) {
            try stdout.print(" ", .{});
        }
    }
}
