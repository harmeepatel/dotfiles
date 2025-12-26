const std = @import("std");
const stdout = std.fs.File.stdout();

const root = @import("root.zig");
const Map = root.Map;

var status_map: Map = .init;

pub fn main() !void {
    // command
    const gs_cmd = [_][]const u8{ "git", "status", "--porcelain" };

    // allocator
    var alloc_buf: [1 << 16]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&alloc_buf);
    const allocator = fba.allocator();
    defer allocator.free(&alloc_buf);

    // process
    const gs_process = try std.process.Child.run(.{ .allocator = allocator, .argv = &gs_cmd });

    if (gs_process.term.Exited != 0 or gs_process.stdout.len == 0) {
        std.process.exit(0);
    }

    // collect status
    var line_split = std.mem.splitScalar(u8, gs_process.stdout, '\n');
    while (line_split.next()) |line| {
        if (line.len == 0) {
            continue;
        }
        const status_split = std.mem.trim(u8, line[0..2], " ");
        status_map.insertOrAddOne(status_split);
    }

    // constructing output
    _ = try stdout.write(" %f[");
    defer _ = stdout.write("%f]") catch {};

    var status_iter = status_map.iterator();
    while (status_iter.next()) |entry| {
        const key = entry.key;
        const val = entry.value;
        const col = if (std.mem.containsAtLeast(u8, key, 1, "D"))
            "%F{1}" // red
        else if (std.mem.containsAtLeast(u8, key, 1, "M"))
            "%F{2}" // yellow
        else if (std.mem.containsAtLeast(u8, key, 1, "T"))
            "%F{28}" // shade_green
        else if (std.mem.containsAtLeast(u8, key, 1, "?"))
            "%F{4}" // blue
        else
            "%F{234}";

        if (status_iter.index != 1) {
            _ = try stdout.write(" ");
        }
        const status = try std.fmt.allocPrint(allocator, "{s}{d}{s}", .{ col, val, key });
        defer allocator.free(status);
        _ = try stdout.write(status);
    }
}
