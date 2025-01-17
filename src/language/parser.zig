const std = @import("std");
const assert = std.debug.assert;
const Source = @import("source.zig").Source;

pub const ParseOptions = struct {};

pub fn parse(comptime T: type, source: T) !void {
    comptime assert(T == []const u8 or T == *Source);
    std.debug.print(source);
}
