const std = @import("std");
const assert = std.debug.assert;
const testing = std.testing;
const expect = testing.expect;
const expectEqualStrings = testing.expectEqualStrings;

pub const Location = struct {
    line: usize,
    column: usize,
};

pub const Source = struct {
    pub const Config = struct {
        name: []const u8 = "GraphQL request",
        location_offset: Location = Location{
            .line = 1,
            .column = 1,
        },
    };

    body: []const u8,
    name: []const u8,
    location_offset: Location,

    pub fn init(body: []const u8, config: Config) Source {
        assert(config.location_offset.line > 0);
        assert(config.location_offset.column > 0);
        return Source{
            .body = body,
            .name = config.name,
            .location_offset = config.location_offset,
        };
    }
};

test "Source.Config default values" {
    const config = Source.Config{};
    try expectEqualStrings("GraphQL request", config.name);
    try expect(config.location_offset.line == 1);
    try expect(config.location_offset.column == 1);
}

test "Source.init empty body" {
    const source = Source.init("", .{});
    try expectEqualStrings("GraphQL request", source.name);
    const config = Source.Config{};
    try expectEqualStrings(config.name, source.name);
    try expect(config.location_offset.line == config.location_offset.line);
    try expect(config.location_offset.column == config.location_offset.column);
}
