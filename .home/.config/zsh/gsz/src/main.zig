const std = @import("std");
const root = @import("root.zig");
const stdout_writer = std.io.getStdOut().writer();
const Map = root.Map;

pub fn main() !void {
    // command
    const git_status_cmd = [_][]const u8{ "git", "status", "-s" };

    // allocator
    var alloc_buf: [1 << 16]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&alloc_buf);
    const allocator = fba.allocator();
    defer allocator.free(&alloc_buf);

    // process
    var process = std.process.Child.init(&git_status_cmd, allocator);
    process.stdout_behavior = .Pipe;
    process.stderr_behavior = .Pipe;
    try process.spawn();

    // stdout
    const stdout = try process.stdout.?.readToEndAlloc(allocator, std.math.maxInt(usize));
    defer allocator.free(stdout);
    const term = try process.wait(); // all output is collected at this point

    if (term.Exited != 0 or stdout.len == 0) {
        try stdout_writer.print("", .{});
        std.process.exit(0);
    }

    // status map
    var status_map: Map = .init;
    // defer status_map.deinit();

    var line_split = std.mem.splitScalar(u8, stdout, '\n');
    while (line_split.next()) |line| {
        if (line.len == 0) {
            continue;
        }
        const status_split = std.mem.trim(u8, line[0..2], " ");
        status_map.insertOrAddOne(status_split);
    }

    // constructing output
    stdout_writer.print(" %f[", .{}) catch {}; // reset color before
    defer stdout_writer.print("%f]", .{}) catch {}; // reset color after

    var space_idx: u16 = 0;
    var status_iter = status_map.iterator();
    while (status_iter.next()) |entry| : (space_idx += 1) {
        const key = entry.key;
        const val = entry.value;
        const col = if (std.mem.containsAtLeast(u8, key, 1, "D"))
            "%F{1}" // red
        else if (std.mem.containsAtLeast(u8, key, 1, "M"))
            "%F{2}" // yellow
        else if (std.mem.containsAtLeast(u8, key, 1, "?"))
            "%F{4}" // blue
        else
            "%F{0}";
        try stdout_writer.print("{s}{d}{s}", .{ col, val, key });
        if (space_idx < status_map.size() - 1) {
            try stdout_writer.print(" ", .{});
        }
    }
}
