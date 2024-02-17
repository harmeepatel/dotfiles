const std = @import("std");
const root = @import("root.zig");
const dbg_print = std.debug.print;

const BUF_SIZE = 128 * 128;
const LINE_SIZE = 128;

pub fn main() !void {
    const git_status_cmd = [_][]const u8{ "git", "status", "-s" };

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var process = std.ChildProcess.init(&git_status_cmd, allocator);
    process.stdout_behavior = .Pipe;
    try process.spawn();

    var buffer: [BUF_SIZE]u8 = undefined;
    const n_bytes = try process.stdout.?.readAll(&buffer);

    var gs = std.AutoArrayHashMap(u8, u8).init(allocator);
    defer gs.deinit();

    var iter_count: usize = 0;

    var i: usize = 0;
    while (i < n_bytes) : (i += 1) {
        var line = std.ArrayList(u8).init(allocator);
        defer line.deinit();

        var three_chars_flag: usize = 0;
        while (buffer[i] != '\n') : (i += 1) {
            if (three_chars_flag == 3) {
                iter_count += 1;
                continue;
            }
            _ = try line.append(buffer[i]);
            three_chars_flag += 1;
            iter_count += 1;
        }
        const status_symbol = std.mem.trim(u8, line.items, " ");
        const status = try gs.getOrPut(status_symbol[0]);

        if (status.found_existing) {
            status.value_ptr.* += 1;
        } else {
            status.value_ptr.* = 1;
        }
        iter_count += 1;
    }

    // var output: [16]u8 = undefined;
    i = 0;
    var it = gs.iterator();
    const stdout_writer = std.io.getStdOut().writer();
    while (it.next()) |val| : (i += 1) {
        _ = try std.fmt.format(stdout_writer, "{d}{c}", .{ val.value_ptr.*, val.key_ptr.* });
        if (i < it.len - 1) {
            _ = try std.fmt.format(stdout_writer, " ", .{});
        }
    }
    dbg_print("iter_count: {}", .{iter_count});
}

test "simple test" {
    dbg_print("test\n", .{});
}
