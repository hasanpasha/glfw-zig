const std = @import("std");
const glfw = @import("glfw");

pub fn main() anyerror!void {
    _ = glfw.setErrorCallback(errorCallback);

    // var gpa = std.heap.GeneralPurposeAllocator(.{}).init;
    // defer if (gpa.deinit() == .leak) @panic("memory leak");

    // var gpa_allocator = gpa.allocator();

    // var z_alloc = std.heap.page_allocator;

    // const allocator = glfw.Allocator{
    //     .allocate = alloc,
    //     .reallocate = realloc,
    //     .deallocate = dealloc,
    //     .user = &z_alloc,
    // };

    // glfw.initAllocator(&allocator);

    // glfw.initHint(@intFromEnum(glfw.InitHint.platform), @intFromEnum(glfw.Platform.wayland));
    glfw.initHint(.angle_platform_type, .{ .angle_platform_type = .opengl });
    glfw.initHint(.wayland_libdecor, .{ .wayland_libdecor = .prefer_libdecor });

    if (!glfw.init()) return glfw.getError(null).check();
    defer glfw.terminate();

    glfw.Window.hint(.opengl_profile, .{ .opengl_profile = .core });
    glfw.Window.hint(.context_version_major, .{ .int = 3 });
    glfw.Window.hint(.context_version_minor, .{ .int = 3 });
    glfw.Window.hint(.resizable, .{ .boolean = true });
    glfw.Window.hint(.refresh_rate, .{ .int_or = .dont_care });
    glfw.Window.hint(.context_creation_api, .{ .context_creation_api = .native });
    glfw.Window.hintString(.wayland_app_id, "FUCKYOU");
    glfw.Window.hint(.stereo, .{ .boolean = false });

    if (glfw.platformSupported(.win32)) {
        std.log.info("wayland is supported", .{});
    } else {
        std.log.err("wayland is not supported", .{});
    }
    std.log.info("{}", .{glfw.getPlatform()});

    // var major: c_int = undefined;
    var rev: c_int = undefined;
    glfw.getVersion(null, null, &rev);
    std.debug.print("rev: {}\n", .{rev});
    std.debug.print("version string: {s}\n", .{glfw.getVersionString()});

    const window = glfw.Window.create(800, 600, "hello world", null, null) orelse return glfw.getError(null).check();
    defer window.destroy();

    _ = window.setKeyCallback(keyCallback);
    _ = window.setCloseCallback(windowCloseCallback);

    const wayland_display = glfw.native.getWaylandDisplay();
    std.log.debug("wayland display: {any}", .{wayland_display});
    const wayland_surface = glfw.native.getWaylandWindow(window);
    std.log.debug("wayland_surface: {any}", .{wayland_surface});

    // const is_resizeable = window.getAttrib(.resizable);
    // std.log.info("is_resizeable: {}", .{is_resizeable});
    // window.setAttrib(.iconified, 1);

    const is_resizeable2 = window.getAttrib(.resizable);
    std.log.info("is_resizeable2: {}", .{is_resizeable2});
    // window.setAttrib(.decorated, false);
    // window.setAttrib(.resizable, false);
    // window.setAttrib(.auto_iconify, false);
    // // window.setAttrib(.mouse_passthrough, true);
    // window.setAttrib(.focus_on_show, false);

    // window.setInputMode(.lock_key_mods, 1);
    window.setInputMode(.lock_key_mods, .{ .boolean = true });
    std.debug.print("input cursor mode: {}\n", .{window.getInputMode(.lock_key_mods).boolean});

    const hat = glfw.JoyStickHat.right_down;
    _ = hat;

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

    // window.setIcon(0, null);
    // const cursor = glfw.Cursor.create(&image, 0, 0) orelse return error.creating_cursor_failed;
    // const cursor = glfw.Cursor.createStandard(.crosshair) orelse return error.creating_cursor_failed;
    // defer cursor.destroy();
    // window.setCursor(cursor);

    _ = window.setDropCallback(dropCallback);
    _ = window.setMouseButtonCallback(mouseButtonCallback);

    // const new_moniter = glfw.Monitor.getPrimaryMonitor() orelse return error.no_moniter;
    // window.setMonitor(new_moniter, 50, 50, 800, 600, 144);

    // var num_of_moniters: c_int = undefined;
    // _ = glfw.Monitor.getMonitors(&num_of_moniters);
    // std.log.debug("number: of moniters: {}", .{num_of_moniters});

    // const moniter = window.getMonitor() orelse return {
    //     std.log.err("no moniter", .{});
    //     return glfw.getError(null).check();
    // };
    // // moniter.setUserPointer(window);
    // std.log.info("moniter name: {s}", .{moniter.getName() orelse "noname"});

    // const video_mode = moniter.getVideoMode() orelse return error.no_video_mode;
    // std.log.debug("video mode: {}", .{video_mode});

    // const gamma = moniter.getGammaRamp();
    // _ = gamma;
    // std.log.debug("gammaramp: {}", .{gamma.?});

    _ = glfw.JoyStick.setJoystickCallback(joystickCallback);

    var req_count: u32 = undefined;
    const ins = glfw.getRequiredInstanceExtensions(&req_count);
    if (ins) |insx| {
        const names = insx[0..@intCast(req_count)];
        std.log.info("extensions: {s}", .{names});
    }
    const vulkan_support = glfw.vulkanSupported();
    std.log.debug("vulkan_support: {}", .{vulkan_support});

    window.makeContextCurrent();
    while (!window.shouldClose()) {
        // const inter = glfw.vulkanSupported();
        // std.log.debug("timer: {}", .{inter});

        // var state: glfw.Gamepadstate = undefined;
        // if (glfw.JoyStick.getGamepadState(.@"1", &state)) {
        //     const a_state = state.getButtonAction(.button_a);
        //     // // _ = a_state;
        //     std.log.info("a_state: {}", .{a_state});
        //     const axis_right_x = state.getAxisState(.axis_right_x);
        //     std.log.info("axis_right_x: {}", .{axis_right_x});
        // }

        window.swapBuffers();
        glfw.pollEvents();
    }
}

fn keyCallback(window_p: ?*glfw.Window, key: glfw.Key, _: c_int, action: glfw.ClickAction, mods: glfw.Mods) callconv(.c) void {
    const window = window_p orelse return;

    std.log.debug("keyboard: {x}\n", .{@intFromEnum(mods)});
    if (key == .escape and action == .press and mods.has(.num_lock))
        window.setShouldClose(true);

    if (key == .space and action == .press)
        window.setCursor(null);
}

fn errorCallback(error_code: glfw.Error, description: [*:0]const u8) callconv(.c) void {
    std.log.err("{}: {s}", .{ error_code, description });
    std.process.exit(1);
}

fn windowCloseCallback(window: ?*glfw.Window) callconv(.c) void {
    // Block any attempts to close the window in ways other than Ctrl+Escape
    // window.?.setShouldClose(false);
    _ = window;
}

fn alloc(size: usize, user: ?*anyopaque) callconv(.C) ?*anyopaque {
    std.log.info("allocating {}", .{size});
    const allocator: *std.mem.Allocator = @alignCast(@ptrCast(user));
    const buf = allocator.alloc(u8, size) catch return null;
    return buf.ptr;
}

fn realloc(block: ?*anyopaque, size: usize, user: ?*anyopaque) callconv(.C) ?*anyopaque {
    std.log.info("reallocating {}", .{size});

    if (block == null) return block;

    const block_ptr: [*]u8 = @alignCast(@ptrCast(block));
    const block_buf = block_ptr[0..size];
    const allocator: *std.mem.Allocator = @alignCast(@ptrCast(user));
    const buf = allocator.realloc(block_buf, size) catch return null;
    return buf.ptr;
}

fn dealloc(block: ?*anyopaque, user: ?*anyopaque) callconv(.C) void {
    std.log.info("deallocating {?}", .{block});

    if (block == null) return;

    const block_ptr: [*]u8 = @alignCast(@ptrCast(block));
    // const block_buf = block_ptr[0..size];
    const allocator: *std.mem.Allocator = @alignCast(@ptrCast(user));
    // allocator.free(block_ptr);
    _ = block_ptr;
    _ = allocator;
}

fn dropCallback(window: ?*glfw.Window, path_count: c_int, paths: [*][*:0]const u8) callconv(.c) void {
    _ = window;
    // _ = path_count;
    // _ = paths;
    const paths_z = paths[0..@intCast(path_count)];
    std.log.debug("paths: {s}", .{paths_z});
}

fn mouseButtonCallback(window: ?*glfw.Window, button: glfw.MouseButton, action: glfw.ClickAction, mods: glfw.Mods) callconv(.C) void {
    _ = window;
    // _ = mods;
    // _ = action;
    std.log.debug("clicked mouse: {}, action: {}, mods: {}\n", .{
        button,
        action,
        mods,
    });
}

fn joystickCallback(jid: glfw.JoyStick, event: glfw.Event) callconv(.c) void {
    std.log.debug("jid: [{}] present {}, name: {s}", .{ jid, jid.present(), jid.getName() orelse "null" });
    std.log.debug("jid: event {}", .{event});
    std.log.debug("jid: ispad: {}, padname {s}", .{ jid.isGamepad(), jid.getGamepadName() orelse "null" });
}
