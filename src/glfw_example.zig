const std = @import("std");
const glfw = @import("glfw");

pub fn main() anyerror!void {
    if (!glfw.init()) return glfw.getError(null).check();
    defer glfw.terminate();

    // var major: c_int = undefined;
    var rev: c_int = undefined;
    glfw.getVersion(null, null, &rev);
    std.debug.print("rev: {}\n", .{rev});
    std.debug.print("version string: {s}\n", .{glfw.getVersionString()});

    _ = glfw.setErrorCallback(errorCallback);

    const window = glfw.Window.create(800, 600, "hello world", null, null) orelse return glfw.getError(null).check();
    defer window.destroy();

    _ = window.setKeyCallback(keyCallback);
    _ = window.setCloseCallback(windowCloseCallback);

    const file = try std.fs.cwd().openFile("src/cat.bgra", .{});
    defer file.close();

    const buf = try file.readToEndAlloc(std.heap.page_allocator, 0x64000);
    // _ = buf;

    const image = glfw.Image{
        .height = 64,
        .width = 64,
        .pixels = buf.ptr,
    };
    // _ = image;

    const images = [_]glfw.Image{
        image,
        image,
    };
    _ = images;

    window.setIcon(0, null);
    // const cursor = glfw.Cursor.create(&image, 0, 0) orelse return error.creating_cursor_failed;
    const cursor = glfw.Cursor.createStandard(.crosshair) orelse return error.creating_cursor_failed;
    defer cursor.destroy();
    window.setCursor(cursor);

    while (!window.shouldClose()) {
        window.swapBuffers();
        glfw.pollEvents();
    }
}

fn keyCallback(window_p: ?*glfw.Window, key: glfw.Key, _: c_int, action: glfw.KeyAction, mods: glfw.Mods) callconv(.c) void {
    const window = window_p orelse return;

    if (key == .escape and action == .press and mods == .control)
        window.setShouldClose(true);

    if (key == .space and action == .press)
        window.setCursor(null);
}

fn errorCallback(error_code: glfw.Error, description: [*:0]const u8) callconv(.c) void {
    std.log.err("{s}: {s}", .{ @tagName(error_code), description });
    std.process.exit(1);
}

fn windowCloseCallback(window: ?*glfw.Window) callconv(.c) void {
    // Block any attempts to close the window in ways other than Ctrl+Escape
    window.?.setShouldClose(false);
}
