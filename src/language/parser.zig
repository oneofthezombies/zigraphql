const std = @import("std");
const assert = std.debug.assert;
const source = @import("source.zig");
const Source = source.Source;

pub fn parse(comptime T: type, src: T) !void {
    comptime assert(T == []const u8 or T == *Source);
    std.debug.print(src);
}
