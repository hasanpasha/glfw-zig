const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const glfw_mod = b.addModule("glfw", .{
        .root_source_file = b.path("src/glfw.zig"),
        .target = target,
        .optimize = optimize,
    });

    const example = b.addExecutable(.{
        .name = "glfw-example",
        .root_source_file = b.path("src/glfw_example.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    example.root_module.addImport("glfw", glfw_mod);
    example.linkSystemLibrary("glfw");

    const artifact = b.addInstallArtifact(example, .{});

    const example_run = b.addRunArtifact(example);
    example_run.step.dependOn(&artifact.step);

    const example_step = b.step("example", "run simple example");
    example_step.dependOn(&example_run.step);
}
