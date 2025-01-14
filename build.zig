const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const zigraphql = b.addExecutable(.{
        .name = "zigraphql",
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("src/zigraphql.zig"),
    });
    b.installArtifact(zigraphql);
}
