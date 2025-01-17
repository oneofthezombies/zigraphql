const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const zigraphql = b.addStaticLibrary(.{
        .name = "zigraphql",
        .root_source_file = b.path("src/zigraphql.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(zigraphql);
}
