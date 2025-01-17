const Source = @import("source.zig").Source;
const Token = @import("ast.zig").Token;

pub const Lexer = struct {
    source: *Source,
    last_token: *Token,
    token: *Token,
    line: usize,
    line_start: usize,

    pub fn init(source: *Source) Lexer {
        return Lexer{
            .source = source,
            .last_token = null,
            .token = null,
            .line = 1,
            .line_start = 0,
        };
    }
};
