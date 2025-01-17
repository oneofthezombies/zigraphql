const std = @import("std");
const assert = std.debug.assert;
const Source = @import("source.zig").Source;
const Lexer = @import("lexer.zig").Lexer;

pub const ParseOptions = struct {
    no_location: ?bool = null,
    max_tokens: ?usize = null,
};

pub const SourceInput = union(enum) {
    string: []const u8,
    source: *Source,
};

pub fn parse(source: SourceInput, options: ParseOptions) !void {
    std.debug.print("", source, options);
}

pub const Parser = struct {
    options: ParseOptions,
    lexer: *Lexer,
    token_counter: usize,

    pub fn tokenCount(self: *Parser) usize {
        return self.token_counter;
    }
};
