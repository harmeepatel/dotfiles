const std = @import("std");
const testing = std.testing;

pub const Entry = struct {
    key: []const u8,
    value: usize,
};

const MapSize = 128;

pub const Map = struct {
    const Self = @This();

    entries: [MapSize]Entry,
    head: u8,

    pub const init = std.mem.zeroes(Self);

    pub const Iterator = struct {
        m: *const Self,
        index: u8 = 0,

        pub fn next(it: *Iterator) ?Entry {
            std.debug.assert(it.index < it.m.capacity());
            if (it.m.head == 0) return null;

            while (it.m.head >= 0) : ({
                it.index += 1;
            }) {
                if (it.m.entries[it.index].value == 0) break;

                const key = it.m.entries[it.index].key;
                const value = it.m.entries[it.index].value;
                it.index += 1;
                return Entry{ .key = key, .value = value };
            }

            return null;
        }
    };

    pub fn insertOrAddOne(self: *Self, key: []const u8) void {
        std.debug.assert(self.head < MapSize);

        if (self.contains(key)) |i| {
            self.entries[i].value += 1;
            return;
        }

        self.entries[self.head] = Entry{
            .key = key,
            .value = 1,
        };
        self.head += 1;
    }

    pub fn contains(self: *Map, key: []const u8) ?usize {
        for (0..self.head) |i| {
            if (std.mem.eql(u8, self.entries[i].key, key)) return i;
        }
        return null;
    }

    pub fn capacity(self: Map) u8 {
        return MapSize - self.head;
    }

    pub fn size(self: Map) u8 {
        return self.head;
    }

    pub fn iterator(self: *const Self) Iterator {
        return Iterator{ .m = self };
    }
};

test "map_insert" {
    var map: Map = .init;
    map.insertOrAddOne("one");

    var tm = std.mem.zeroes(Map);
    tm.entries[0] = Entry{ .key = "one", .value = 1 };
    tm.head = 1;
    try testing.expectEqual(tm, map);
}

test "incrementing" {
    var map: Map = .init;
    map.insertOrAddOne("one");
    map.insertOrAddOne("one");

    var tm = std.mem.zeroes(Map);
    tm.entries[0] = Entry{ .key = "one", .value = 2 };
    tm.head = 1;
    try testing.expectEqual(tm, map);
}

test "contains" {
    var map: Map = .init;
    map.insertOrAddOne("one");
    map.insertOrAddOne("two");
    map.insertOrAddOne("three");

    try testing.expectEqual(1, map.contains("two"));
    try testing.expectEqual(null, map.contains("four"));
}
