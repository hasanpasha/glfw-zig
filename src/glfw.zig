const std = @import("std");
pub const native = @import("native.zig");

const zeroes = std.mem.zeroes;

pub const GLFWglproc = ?*const fn () callconv(.c) void;
pub const GLFWvkproc = ?*const fn () callconv(.c) void;

pub const Monitorfun = ?*const fn (moniter: ?*Monitor, event: Event) callconv(.c) void;

pub const Monitor = opaque {
    extern fn glfwGetMonitors(count: *c_int) ?[*]?*Monitor;
    pub const getMonitors = glfwGetMonitors;

    extern fn glfwGetPrimaryMonitor() ?*Monitor;
    pub const getPrimaryMonitor = glfwGetPrimaryMonitor;

    extern fn glfwGetMonitorPos(monitor: *Monitor, xpos: ?*c_int, ypos: ?*c_int) void;
    pub const getMonitorPos = glfwGetMonitorPos;

    extern fn glfwGetMonitorWorkarea(monitor: *Monitor, xpos: ?*c_int, ypos: ?*c_int, width: ?*c_int, height: ?*c_int) void;
    pub const getWorkarea = glfwGetMonitorWorkarea;

    extern fn glfwGetMonitorPhysicalSize(monitor: *Monitor, widthMM: ?*c_int, heightMM: ?*c_int) void;
    pub const getPhysicalSize = glfwGetMonitorPhysicalSize;

    extern fn glfwGetMonitorContentScale(monitor: *Monitor, xscale: ?*f32, yscale: ?*f32) void;
    pub const getContentScale = glfwGetMonitorContentScale;

    extern fn glfwGetMonitorName(monitor: *Monitor) ?[*:0]const u8;
    pub const getName = glfwGetMonitorName;

    extern fn glfwSetMonitorUserPointer(monitor: *Monitor, pointer: ?*anyopaque) void;
    pub const setUserPointer = glfwSetMonitorUserPointer;

    extern fn glfwGetMonitorUserPointer(monitor: *Monitor) ?*anyopaque;
    pub const getUserPointer = glfwGetMonitorUserPointer;

    extern fn glfwGetVideoModes(monitor: *Monitor, count: *c_int) ?[*]const Vidmode;
    pub const getVideoModes = glfwGetVideoModes;

    extern fn glfwGetVideoMode(monitor: *Monitor) ?*const Vidmode;
    pub const getVideoMode = glfwGetVideoMode;

    extern fn glfwSetGamma(monitor: *Monitor, gamma: f32) void;
    pub const setGamma = glfwSetGamma;

    extern fn glfwGetGammaRamp(monitor: *Monitor) ?*const Gammaramp;
    pub const getGammaRamp = glfwGetGammaRamp;

    extern fn glfwSetGammaRamp(monitor: *Monitor, ramp: ?*const Gammaramp) void;
    pub const setGammaRamp = glfwSetGammaRamp;

    extern fn glfwSetMonitorCallback(callback: Monitorfun) Monitorfun;
    pub const setMonitorCallback = glfwSetMonitorCallback;
};

pub const Windowposfun = ?*const fn (window: ?*Window, xpos: c_int, ypos: c_int) callconv(.c) void;
pub const Windowsizefun = ?*const fn (window: ?*Window, width: c_int, height: c_int) callconv(.c) void;
pub const Windowclosefun = ?*const fn (window: ?*Window) callconv(.c) void;
pub const Windowrefreshfun = ?*const fn (window: ?*Window) callconv(.c) void;
pub const Windowfocusfun = ?*const fn (window: ?*Window, focused: bool) callconv(.c) void;
pub const Windowiconifyfun = ?*const fn (window: ?*Window, iconified: c_int) callconv(.c) void;
pub const Windowmaximizefun = ?*const fn (window: ?*Window, maximized: c_int) callconv(.c) void;
pub const Framebuffersizefun = ?*const fn (window: ?*Window, width: c_int, height: c_int) callconv(.c) void;
pub const Windowcontentscalefun = ?*const fn (window: ?*Window, xscale: f32, yscale: f32) callconv(.c) void;
pub const Mousebuttonfun = ?*const fn (window: ?*Window, button: MouseButton, action: ClickAction, mods: Mods) callconv(.c) void;
pub const Cursorposfun = ?*const fn (window: ?*Window, xpos: f64, ypos: f64) callconv(.c) void;
pub const Cursorenterfun = ?*const fn (window: ?*Window, entered: bool) callconv(.c) void;
pub const Scrollfun = ?*const fn (window: ?*Window, xoffset: f64, yoffset: f64) callconv(.c) void;
pub const Keyfun = ?*const fn (window: ?*Window, key: Key, scancode: c_int, action: ClickAction, mods: Mods) callconv(.c) void;
pub const Charfun = ?*const fn (window: ?*Window, codepoint: c_uint) callconv(.c) void;
pub const Charmodsfun = ?*const fn (window: ?*Window, codepoint: c_uint, mods: Mods) callconv(.c) void;
pub const Dropfun = ?*const fn (window: ?*Window, path_count: c_int, paths: [*][*:0]const u8) callconv(.c) void;

pub const Window = opaque {
    extern fn glfwDefaultWindowHints() void;
    pub const defaultHints = glfwDefaultWindowHints;

    extern fn glfwWindowHint(hint: WindowHint, value: WindowHintValue) void;
    pub const hint = glfwWindowHint;

    extern fn glfwWindowHintString(hint: WindowHint, value: [*:0]const u8) void;
    pub const hintString = glfwWindowHintString;

    extern fn glfwCreateWindow(width: c_int, height: c_int, title: [*:0]const u8, monitor: ?*Monitor, share: ?*Window) ?*Window;
    pub const create = glfwCreateWindow;

    extern fn glfwGetCurrentContext() ?*Window;
    pub const getCurrentContext = glfwGetCurrentContext;

    extern fn glfwDestroyWindow(window: *Window) void;
    pub const destroy = glfwDestroyWindow;

    extern fn glfwWindowShouldClose(window: *Window) bool;
    pub const shouldClose = glfwWindowShouldClose;

    extern fn glfwSetWindowShouldClose(window: *Window, value: bool) void;
    pub const setShouldClose = glfwSetWindowShouldClose;

    extern fn glfwSetWindowTitle(window: *Window, title: [*:0]const u8) void;
    pub const setTitle = glfwSetWindowTitle;

    extern fn glfwSetWindowIcon(window: *Window, count: c_int, images: ?[*]const Image) void;
    pub const setIcon = glfwSetWindowIcon;

    extern fn glfwGetWindowPos(window: *Window, xpos: ?*c_int, ypos: ?*c_int) void;
    pub const getPos = glfwGetWindowPos;

    extern fn glfwSetWindowPos(window: *Window, xpos: c_int, ypos: c_int) void;
    pub const setPos = glfwSetWindowPos;

    extern fn glfwGetWindowSize(window: *Window, width: ?*c_int, height: ?*c_int) void;
    pub const getSize = glfwGetWindowSize;

    extern fn glfwSetWindowSizeLimits(window: *Window, minwidth: c_int, minheight: c_int, maxwidth: c_int, maxheight: c_int) void;
    pub const setSizeLimits = glfwSetWindowSizeLimits;

    extern fn glfwSetWindowAspectRatio(window: *Window, numer: c_int, denom: c_int) void;
    pub const setAspectRatio = glfwSetWindowAspectRatio;

    extern fn glfwSetWindowSize(window: *Window, width: c_int, height: c_int) void;
    pub const setSize = glfwSetWindowSize;

    extern fn glfwGetFramebufferSize(window: *Window, width: ?*c_int, height: ?*c_int) void;
    pub const getFramebufferSize = glfwGetFramebufferSize;

    extern fn glfwGetWindowFrameSize(window: *Window, left: ?*c_int, top: ?*c_int, right: ?*c_int, bottom: ?*c_int) void;
    pub const getFrameSize = glfwGetWindowFrameSize;

    extern fn glfwGetWindowContentScale(window: *Window, xscale: ?*f32, yscale: ?*f32) void;
    pub const getContentScale = glfwGetWindowContentScale;

    extern fn glfwGetWindowOpacity(window: *Window) f32;
    pub const getOpacity = glfwGetWindowOpacity;

    extern fn glfwSetWindowOpacity(window: *Window, opacity: f32) void;
    pub const setOpacity = glfwSetWindowOpacity;

    extern fn glfwIconifyWindow(window: *Window) void;
    pub const iconify = glfwIconifyWindow;

    extern fn glfwRestoreWindow(window: *Window) void;
    pub const restoreWindow = glfwRestoreWindow;

    extern fn glfwMaximizeWindow(window: *Window) void;
    pub const maximize = glfwMaximizeWindow;

    extern fn glfwShowWindow(window: *Window) void;
    pub const show = glfwShowWindow;

    extern fn glfwHideWindow(window: *Window) void;
    pub const hide = glfwHideWindow;

    extern fn glfwFocusWindow(window: *Window) void;
    pub const focus = glfwFocusWindow;

    extern fn glfwRequestWindowAttention(window: *Window) void;
    pub const requestAttention = glfwRequestWindowAttention;

    extern fn glfwGetWindowMonitor(window: *Window) ?*Monitor;
    pub const getMonitor = glfwGetWindowMonitor;

    extern fn glfwSetWindowMonitor(window: *Window, monitor: ?*Monitor, xpos: c_int, ypos: c_int, width: c_int, height: c_int, refreshRate: c_int) void;
    pub const setMonitor = glfwSetWindowMonitor;

    extern fn glfwGetWindowAttrib(window: *Window, attrib: WindowAttribute) bool;
    pub const getAttrib = glfwGetWindowAttrib;

    extern fn glfwSetWindowAttrib(window: *Window, attrib: WindowAttribute, value: bool) void;
    pub const setAttrib = glfwSetWindowAttrib;

    extern fn glfwSetWindowUserPointer(window: *Window, pointer: ?*anyopaque) void;
    pub const setUserPointer = glfwSetWindowUserPointer;

    extern fn glfwGetWindowUserPointer(window: *Window) ?*anyopaque;
    pub const getUserPointer = glfwGetWindowUserPointer;

    extern fn glfwGetInputMode(window: *Window, mode: InputMode) InputModeValue;
    pub const getInputMode = glfwGetInputMode;

    extern fn glfwSetInputMode(window: *Window, mode: InputMode, value: InputModeValue) void;
    pub const setInputMode = glfwSetInputMode;

    extern fn glfwGetKey(window: *Window, key: Key) ClickAction;
    pub const getKey = glfwGetKey;

    extern fn glfwGetMouseButton(window: *Window, button: c_int) c_int;
    pub const getMouseButton = glfwGetMouseButton;

    extern fn glfwGetCursorPos(window: *Window, xpos: ?*f64, ypos: ?*f64) void;
    pub const getCursorPos = glfwGetCursorPos;

    extern fn glfwSetCursorPos(window: *Window, xpos: f64, ypos: f64) void;
    pub const setCursorPos = glfwSetCursorPos;

    extern fn glfwSetCursor(window: *Window, cursor: ?*Cursor) void;
    pub const setCursor = glfwSetCursor;

    extern fn glfwSetClipboardString(window: ?*Window, string: [*:0]const u8) void;
    pub const setClipboardString = glfwSetClipboardString;

    extern fn glfwGetClipboardString(window: ?*Window) ?[*:0]const u8;
    pub const getClipboardString = glfwGetClipboardString;

    extern fn glfwMakeContextCurrent(window: ?*Window) void;
    pub const makeContextCurrent = glfwMakeContextCurrent;

    extern fn glfwSwapBuffers(window: *Window) void;
    pub const swapBuffers = glfwSwapBuffers;

    extern fn glfwSetWindowPosCallback(window: *Window, callback: Windowposfun) Windowposfun;
    pub const setPosCallback = glfwSetWindowPosCallback;

    extern fn glfwSetWindowSizeCallback(window: *Window, callback: Windowsizefun) Windowsizefun;
    pub const setSizeCallback = glfwSetWindowSizeCallback;

    extern fn glfwSetWindowCloseCallback(window: *Window, callback: Windowclosefun) Windowclosefun;
    pub const setCloseCallback = glfwSetWindowCloseCallback;

    extern fn glfwSetWindowRefreshCallback(window: *Window, callback: Windowrefreshfun) Windowrefreshfun;
    pub const setRefreshCallback = glfwSetWindowRefreshCallback;

    extern fn glfwSetWindowFocusCallback(window: *Window, callback: Windowfocusfun) Windowfocusfun;
    pub const setFocusCallback = glfwSetWindowFocusCallback;

    extern fn glfwSetWindowIconifyCallback(window: *Window, callback: Windowiconifyfun) Windowiconifyfun;
    pub const setIconifyCallback = glfwSetWindowIconifyCallback;

    extern fn glfwSetWindowMaximizeCallback(window: *Window, callback: Windowmaximizefun) Windowmaximizefun;
    pub const setMaximizeCallback = glfwSetWindowMaximizeCallback;

    extern fn glfwSetFramebufferSizeCallback(window: *Window, callback: Framebuffersizefun) Framebuffersizefun;
    pub const SetFramebufferSizeCallback = glfwSetFramebufferSizeCallback;

    extern fn glfwSetWindowContentScaleCallback(window: *Window, callback: Windowcontentscalefun) Windowcontentscalefun;
    pub const setContentScaleCallback = glfwSetWindowContentScaleCallback;

    extern fn glfwSetKeyCallback(window: *Window, callback: Keyfun) Keyfun;
    pub const setKeyCallback = glfwSetKeyCallback;

    extern fn glfwSetCharCallback(window: *Window, callback: Charfun) Charfun;
    pub const setCharCallback = glfwSetCharCallback;

    extern fn glfwSetCharModsCallback(window: *Window, callback: Charmodsfun) Charmodsfun;
    pub const setCharModsCallback = glfwSetCharModsCallback;

    extern fn glfwSetMouseButtonCallback(window: *Window, callback: Mousebuttonfun) Mousebuttonfun;
    pub const setMouseButtonCallback = glfwSetMouseButtonCallback;

    extern fn glfwSetCursorPosCallback(window: *Window, callback: Cursorposfun) Cursorposfun;
    pub const setCursorPosCallback = glfwSetCursorPosCallback;

    extern fn glfwSetCursorEnterCallback(window: *Window, callback: Cursorenterfun) Cursorenterfun;
    pub const setCursorEnterCallback = glfwSetCursorEnterCallback;

    extern fn glfwSetScrollCallback(window: *Window, callback: Scrollfun) Scrollfun;
    pub const setScrollCallback = glfwSetScrollCallback;

    extern fn glfwSetDropCallback(window: *Window, callback: Dropfun) Dropfun;
    pub const setDropCallback = glfwSetDropCallback;
};

pub const Cursor = opaque {
    extern fn glfwCreateCursor(image: *const Image, xhot: c_int, yhot: c_int) ?*Cursor;
    pub const create = glfwCreateCursor;

    extern fn glfwCreateStandardCursor(shape: CursorShape) ?*Cursor;
    pub const createStandard = glfwCreateStandardCursor;

    extern fn glfwDestroyCursor(cursor: *Cursor) void;
    pub const destroy = glfwDestroyCursor;
};

pub const Errorfun = ?*const fn (error_code: Error, description: [*:0]const u8) callconv(.c) void;
pub const Joystickfun = ?*const fn (jid: JoyStick, event: Event) callconv(.c) void;

pub const Vidmode = extern struct {
    width: c_int = zeroes(c_int),
    height: c_int = zeroes(c_int),
    redBits: c_int = zeroes(c_int),
    greenBits: c_int = zeroes(c_int),
    blueBits: c_int = zeroes(c_int),
    refreshRate: c_int = zeroes(c_int),
};

pub const Gammaramp = extern struct {
    red: [*c]c_ushort = zeroes([*c]c_ushort),
    green: [*c]c_ushort = zeroes([*c]c_ushort),
    blue: [*c]c_ushort = zeroes([*c]c_ushort),
    size: c_uint = zeroes(c_uint),
};

pub const Image = extern struct {
    width: c_int,
    height: c_int,
    pixels: [*]u8,
};

pub const Gamepadstate = extern struct {
    buttons: [15]ClickAction = zeroes([15]ClickAction),
    axes: [6]f32 = zeroes([6]f32),

    pub fn getButtonAction(self: Gamepadstate, button: GamepadButton) ClickAction {
        return self.buttons[@intCast(@intFromEnum(button))];
    }

    pub fn getAxisState(self: Gamepadstate, axis: GamepadAxis) f32 {
        return self.axes[@intCast(@intFromEnum(axis))];
    }
};

pub const Allocatefun = ?*const fn (size: usize, user: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const Reallocatefun = ?*const fn (block: ?*anyopaque, size: usize, user: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const Deallocatefun = ?*const fn (block: ?*anyopaque, user: ?*anyopaque) callconv(.c) void;

pub const Allocator = extern struct {
    allocate: Allocatefun,
    reallocate: Reallocatefun,
    deallocate: Deallocatefun,
    user: ?*anyopaque,
};

extern fn glfwInit() bool;
pub const init = glfwInit;

extern fn glfwTerminate() void;
pub const terminate = glfwTerminate;

extern fn glfwInitHint(hint: InitHint, value: InitHintValue) void;
pub const initHint = glfwInitHint;

extern fn glfwInitAllocator(allocator: ?*const Allocator) void;
pub const initAllocator = glfwInitAllocator;

extern fn glfwInitVulkanLoader(loader: ?*anyopaque) void;
pub const initVulkanLoader = glfwInitVulkanLoader;

extern fn glfwGetVersion(major: ?*c_int, minor: ?*c_int, rev: ?*c_int) void;
pub const getVersion = glfwGetVersion;

extern fn glfwGetVersionString() [*:0]const u8;
pub const getVersionString = glfwGetVersionString;

extern fn glfwGetError(description: ?*?[*:0]const u8) Error;
pub const getError = glfwGetError;

extern fn glfwSetErrorCallback(callback: Errorfun) Errorfun;
pub const setErrorCallback = glfwSetErrorCallback;

extern fn glfwGetPlatform() Platform;
pub const getPlatform = glfwGetPlatform;

extern fn glfwPlatformSupported(platform: Platform) bool;
pub const platformSupported = glfwPlatformSupported;

extern fn glfwPollEvents() void;
pub const pollEvents = glfwPollEvents;

extern fn glfwWaitEvents() void;
pub const waitEvents = glfwWaitEvents;

extern fn glfwWaitEventsTimeout(timeout: f64) void;
pub const waitEventsTimeout = glfwWaitEventsTimeout;

extern fn glfwPostEmptyEvent() void;
pub const postEmptyEvent = glfwPostEmptyEvent;

extern fn glfwRawMouseMotionSupported() c_int;
pub const rawMouseMotionSupported = glfwRawMouseMotionSupported;

extern fn glfwGetTime() f64;
pub const getTime = glfwGetTime;

extern fn glfwSetTime(time: f64) void;
pub const setTime = glfwSetTime;

extern fn glfwGetTimerValue() u64;
pub const getTimerValue = glfwGetTimerValue;

extern fn glfwGetTimerFrequency() u64;
pub const getTimerFrequency = glfwGetTimerFrequency;

extern fn glfwSwapInterval(interval: c_int) void;
pub const swapInterval = glfwSwapInterval;

extern fn glfwExtensionSupported(extension: [*:0]const u8) bool;
pub const extensionSupported = glfwExtensionSupported;

extern fn glfwGetProcAddress(procname: [*c]const u8) GLFWglproc;
pub const getProcAddress = glfwGetProcAddress;

extern fn glfwVulkanSupported() bool;
pub const vulkanSupported = glfwVulkanSupported;

extern fn glfwGetRequiredInstanceExtensions(count: *u32) ?[*][*:0]const u8;
pub const getRequiredInstanceExtensions = glfwGetRequiredInstanceExtensions;

pub const ClickAction = enum(u8) {
    release = 0,
    press = 1,
    repeat = 2,
    _,
};

pub const Key = enum(c_int) {
    unknown = 1,
    space = 32,
    apostrophe = 39,
    comma = 44,
    minus = 45,
    period = 46,
    slash = 47,
    @"0" = 48,
    @"1" = 49,
    @"2" = 50,
    @"3" = 51,
    @"4" = 52,
    @"5" = 53,
    @"6" = 54,
    @"7" = 55,
    @"8" = 56,
    @"9" = 57,
    semicolon = 59,
    equal = 61,
    a = 65,
    b = 66,
    c = 67,
    d = 68,
    e = 69,
    f = 70,
    g = 71,
    h = 72,
    i = 73,
    j = 74,
    k = 75,
    l = 76,
    m = 77,
    n = 78,
    o = 79,
    p = 80,
    q = 81,
    r = 82,
    s = 83,
    t = 84,
    u = 85,
    v = 86,
    w = 87,
    x = 88,
    y = 89,
    z = 90,
    left_bracket = 91,
    backslash = 92,
    right_bracket = 93,
    grave_accent = 96,
    world_1 = 161,
    world_2 = 162,
    escape = 256,
    enter = 257,
    tab = 258,
    backspace = 259,
    insert = 260,
    delete = 261,
    right = 262,
    left = 263,
    down = 264,
    up = 265,
    page_up = 266,
    page_down = 267,
    home = 268,
    end = 269,
    caps_lock = 280,
    scroll_lock = 281,
    num_lock = 282,
    print_screen = 283,
    pause = 284,
    f1 = 290,
    f2 = 291,
    f3 = 292,
    f4 = 293,
    f5 = 294,
    f6 = 295,
    f7 = 296,
    f8 = 297,
    f9 = 298,
    f10 = 299,
    f11 = 300,
    f12 = 301,
    f13 = 302,
    f14 = 303,
    f15 = 304,
    f16 = 305,
    f17 = 306,
    f18 = 307,
    f19 = 308,
    f20 = 309,
    f21 = 310,
    f22 = 311,
    f23 = 312,
    f24 = 313,
    f25 = 314,
    kp_0 = 320,
    kp_1 = 321,
    kp_2 = 322,
    kp_3 = 323,
    kp_4 = 324,
    kp_5 = 325,
    kp_6 = 326,
    kp_7 = 327,
    kp_8 = 328,
    kp_9 = 329,
    kp_decimal = 330,
    kp_divide = 331,
    kp_multiply = 332,
    kp_subtract = 333,
    kp_add = 334,
    kp_enter = 335,
    kp_equal = 336,
    left_shift = 340,
    left_control = 341,
    left_alt = 342,
    left_super = 343,
    right_shift = 344,
    right_control = 345,
    right_alt = 346,
    right_super = 347,
    menu = 348,
    _,

    pub const last = Key.menu;

    extern fn glfwGetKeyName(key: Key, scancode: c_int) ?[*:0]const u8;
    pub const getName = glfwGetKeyName;

    extern fn glfwGetKeyScancode(key: Key) c_int;
    pub const getScancode = glfwGetKeyScancode;
};

pub const Mods = enum(c_int) {
    shift = 0x0001,
    control = 0x0002,
    alt = 0x0004,
    super = 0x0008,
    caps_lock = 0x0010,
    num_lock = 0x0020,
    _,

    pub fn has(self: Mods, mod: Mods) bool {
        return @intFromEnum(self) & @intFromEnum(mod) != 0;
    }

    pub fn has_one(self: Mods, mods: []const Mods) bool {
        for (mods) |mod|
            if (self.has(mod))
                return true;

        return false;
    }

    pub fn has_all(self: Mods, mods: []const Mods) bool {
        for (mods) |mod|
            if (!self.has(mod))
                return false;

        return true;
    }
};

pub const Error = enum(c_int) {
    no_error = 0,
    not_initialized = 0x00010001,
    no_current_context = 0x00010002,
    invalid_enum = 0x00010003,
    invalid_value = 0x00010004,
    out_of_memory = 0x00010005,
    api_unavailable = 0x00010006,
    version_unavailable = 0x00010007,
    platform_error = 0x00010008,
    format_unavailable = 0x00010009,
    no_window_context = 0x0001000A,
    cursor_unavailable = 0x0001000B,
    feature_unavailable = 0x0001000C,
    feature_unimplemented = 0x0001000D,
    platform_unavailable = 0x0001000E,
    _,

    pub const ErrorZ = error{
        not_initialized,
        no_current_context,
        invalid_enum,
        invalid_value,
        out_of_memory,
        api_unavailable,
        version_unavailable,
        platform_error,
        format_unavailable,
        no_window_context,
        cursor_unavailable,
        feature_unavailable,
        feature_unimplemented,
        platform_unavailable,
    };

    pub fn check(self: Error) ErrorZ!void {
        return switch (self) {
            .not_initialized => ErrorZ.not_initialized,
            .no_current_context => ErrorZ.no_current_context,
            .invalid_enum => ErrorZ.invalid_enum,
            .invalid_value => ErrorZ.invalid_value,
            .out_of_memory => ErrorZ.out_of_memory,
            .api_unavailable => ErrorZ.api_unavailable,
            .version_unavailable => ErrorZ.version_unavailable,
            .platform_error => ErrorZ.platform_error,
            .format_unavailable => ErrorZ.format_unavailable,
            .no_window_context => ErrorZ.no_window_context,
            .cursor_unavailable => ErrorZ.cursor_unavailable,
            .feature_unavailable => ErrorZ.feature_unavailable,
            .feature_unimplemented => ErrorZ.feature_unimplemented,
            .platform_unavailable => ErrorZ.platform_unavailable,
            else => {},
        };
    }
};

pub const CursorShape = enum(c_int) {
    arrow = 0x00036001,
    ibeam = 0x00036002,
    crosshair = 0x00036003,
    hand = 0x00036004,
    hresize = 0x00036005,
    vresize = 0x00036006,
    _,
};

pub const InputMode = enum(c_int) {
    sticky_keys = 0x00033002,
    sticky_mouse_buttons = 0x00033003,
    lock_key_mods = 0x00033004,
    raw_mouse_motion = 0x00033005,
    cursor = 0x00033001,
    _,
};

pub const InputCursorMode = enum(c_int) {
    normal = 0x00034001,
    hidden = 0x00034002,
    disabled = 0x00034003,
    captured = 0x00034004,
    _,
};

pub const InputModeValue = extern union {
    boolean: bool,
    cursor: InputCursorMode,
};

pub const JoyStick = enum(c_int) {
    @"1" = 0,
    @"2" = 1,
    @"3" = 2,
    @"4" = 3,
    @"5" = 4,
    @"6" = 5,
    @"7" = 6,
    @"8" = 7,
    @"9" = 8,
    @"10" = 9,
    @"11" = 10,
    @"12" = 11,
    @"13" = 12,
    @"14" = 13,
    @"15" = 14,
    @"16" = 15,
    _,

    pub const last: JoyStick = .@"16";

    extern fn glfwJoystickPresent(jid: JoyStick) bool;
    pub const present = glfwJoystickPresent;

    extern fn glfwGetJoystickAxes(jid: JoyStick, count: [*c]c_int) ?[*]const f32;
    pub const getAxes = glfwGetJoystickAxes;

    extern fn glfwGetJoystickButtons(jid: JoyStick, count: [*c]c_int) ?[*]const ClickAction;
    pub const getButtons = glfwGetJoystickButtons;

    extern fn glfwGetJoystickHats(jid: JoyStick, count: [*c]c_int) ?[*]const JoyStickHat;
    pub const getHats = glfwGetJoystickHats;

    extern fn glfwGetJoystickName(jid: JoyStick) ?[*:0]const u8;
    pub const getName = glfwGetJoystickName;

    extern fn glfwGetJoystickGUID(jid: JoyStick) ?[*:0]const u8;
    pub const getGUID = glfwGetJoystickGUID;

    extern fn glfwSetJoystickUserPointer(jid: JoyStick, pointer: ?*anyopaque) void;
    pub const setUserPointer = glfwSetJoystickUserPointer;

    extern fn glfwGetJoystickUserPointer(jid: JoyStick) ?*anyopaque;
    pub const getUserPointer = glfwGetJoystickUserPointer;

    extern fn glfwJoystickIsGamepad(jid: JoyStick) bool;
    pub const isGamepad = glfwJoystickIsGamepad;

    extern fn glfwGetGamepadName(jid: JoyStick) ?[*:0]const u8;
    pub const getGamepadName = glfwGetGamepadName;

    extern fn glfwGetGamepadState(jid: JoyStick, state: ?*Gamepadstate) bool;
    pub const getGamepadState = glfwGetGamepadState;

    extern fn glfwSetJoystickCallback(callback: Joystickfun) Joystickfun;
    pub const setJoystickCallback = glfwSetJoystickCallback;

    extern fn glfwUpdateGamepadMappings(string: ?[*:0]const u8) bool;
    pub const updateGamepadMappings = glfwUpdateGamepadMappings;
};

pub const JoyStickHat = enum(u8) {
    const hat_up: c_int = 1;
    const hat_right: c_int = 2;
    const hat_down: c_int = 4;
    const hat_left: c_int = 8;

    centered = 0,
    up = hat_up,
    right = hat_right,
    down = hat_down,
    left = hat_left,
    right_up = hat_right | hat_up,
    right_down = hat_right | hat_down,
    left_up = hat_left | hat_up,
    left_down = hat_left | hat_down,
    _,
};

pub const Event = enum(c_int) {
    connected = 0x00040001,
    disconnected = 0x00040002,
};

pub const MouseButton = enum(c_int) {
    @"1" = 0,
    @"2" = 1,
    @"3" = 2,
    @"4" = 3,
    @"5" = 4,
    @"6" = 5,
    @"7" = 6,
    @"8" = 7,
    _,

    pub const last: MouseButton = .@"8";
    pub const left: MouseButton = .@"1";
    pub const right: MouseButton = .@"2";
    pub const middle: MouseButton = .@"3";
};

pub const GamepadButton = enum(c_int) {
    button_a = 0,
    button_b = 1,
    button_x = 2,
    button_y = 3,
    button_left_bumper = 4,
    button_right_bumper = 5,
    button_back = 6,
    button_start = 7,
    button_guide = 8,
    button_left_thumb = 9,
    button_right_thumb = 10,
    button_dpad_up = 11,
    button_dpad_right = 12,
    button_dpad_down = 13,
    button_dpad_left = 14,
    _,

    pub const button_cross: GamepadButton = .button_a;
    pub const button_circle: GamepadButton = .button_b;
    pub const button_square: GamepadButton = .button_x;
    pub const button_triangle: GamepadButton = .button_y;
    pub const button_last: GamepadButton = .button_dpad_left;
};

pub const GamepadAxis = enum(c_int) {
    axis_left_x = 0,
    axis_left_y = 1,
    axis_right_x = 2,
    axis_right_y = 3,
    axis_left_trigger = 4,
    axis_right_trigger = 5,
    _,

    pub const axis_last: GamepadAxis = .axis_right_trigger;
};

pub const InitHint = enum(c_int) {
    joystick_hat_buttons = 0x00050001,
    angle_platform_type = 0x00050002,
    platform = 0x00050003,
    cocoa_chdir_resources = 0x00051001,
    cocoa_menubar = 0x00051002,
    x11_xcb_vulkan_surface = 0x00052001,
    wayland_libdecor = 0x00053001,
    _,
};

pub const InitHintValue = extern union {
    boolean: bool,
    platform: Platform,
    angle_platform_type: AnglePlatformType,
    wayland_libdecor: WaylandLibdecor,
};

pub const WaylandLibdecor = enum(c_int) {
    prefer_libdecor = 0x00038001,
    disable_libdecor = 0x00038002,
    _,
};

pub const AnglePlatformType = enum(c_int) {
    none = 0x00037001,
    opengl = 0x00037002,
    opengles = 0x00037003,
    d3d9 = 0x00037004,
    d3d11 = 0x00037005,
    vulkan = 0x00037007,
    metal = 0x00037008,
    _,
};

pub const Platform = enum(c_int) {
    any_platform = 0x00060000,
    win32 = 0x00060001,
    cocoa = 0x00060002,
    wayland = 0x00060003,
    x11 = 0x00060004,
    null = 0x00060005,
    _,
};

pub const WindowAttribute = enum(c_int) {
    focused = @intFromEnum(WindowHint.focused),
    iconified = @intFromEnum(WindowHint.iconified),
    maximized = @intFromEnum(WindowHint.maximized),
    visible = @intFromEnum(WindowHint.visible),
    transparent_framebuffer = @intFromEnum(WindowHint.transparent_framebuffer),
    hovered = @intFromEnum(WindowHint.hovered),
    // Above can be set by `glfwSetWindowAttrib`
    resizable = @intFromEnum(WindowHint.resizable),
    decorated = @intFromEnum(WindowHint.decorated),
    auto_iconify = @intFromEnum(WindowHint.auto_iconify),
    floating = @intFromEnum(WindowHint.floating),
    mouse_passthrough = @intFromEnum(WindowHint.mouse_passthrough),
    focus_on_show = @intFromEnum(WindowHint.focus_on_show),
};

pub const WindowHint = enum(c_int) {
    pub const cocoa_retina_framebuffer = WindowHint.scale_framebuffer;
    pub const opengl_debug_context = WindowHint.context_debug;

    // window
    focused = 0x00020001,
    iconified = 0x00020002,
    maximized = 0x00020008,
    hovered = 0x0002000B,
    visible = 0x00020004,
    resizable = 0x00020003,
    decorated = 0x00020005,
    auto_iconify = 0x00020006,
    floating = 0x00020007,
    transparent_framebuffer = 0x0002000A,
    focus_on_show = 0x0002000C,
    center_cursor = 0x00020009,
    scale_to_monitor = 0x0002200C,
    scale_framebuffer = 0x00023001,
    mouse_passthrough = 0x0002000D,
    position_x = 0x0002000E,
    position_y = 0x0002000F,

    // framebuffer
    red_bits = 0x00021001,
    green_bits = 0x00021002,
    blue_bits = 0x00021003,
    alpha_bits = 0x00021004,
    depth_bits = 0x00021005,
    stencil_bits = 0x00021006,
    accum_red_bits = 0x00021007,
    accum_green_bits = 0x00021008,
    accum_blue_bits = 0x00021009,
    accum_alpha_bits = 0x0002100A,
    aux_buffers = 0x0002100B,
    stereo = 0x0002100C,
    samples = 0x0002100D,
    srgb_capable = 0x0002100E,
    doublebuffer = 0x00021010,

    // moniter
    refresh_rate = 0x0002100F,

    // context
    client_api = 0x00022001,
    context_creation_api = 0x0002200B,
    context_version_major = 0x00022002,
    context_version_minor = 0x00022003,
    context_revision = 0x00022004,
    opengl_forward_compat = 0x00022006,
    context_debug = 0x00022007,
    opengl_profile = 0x00022008,
    context_robustness = 0x00022005,
    context_release_behavior = 0x00022009,
    context_no_error = 0x0002200A,

    // win32
    win32_keyboard_menu = 0x00025001,
    win32_showdefault = 0x00025002,

    // macos
    cocoa_frame_name = 0x00023002,
    cocoa_graphics_switching = 0x00023003,

    // x11
    /// use `glfw.Window.hintString`
    x11_class_name = 0x00024001,
    /// use `glfw.Window.hintString`
    x11_instance_name = 0x00024002,

    // wayland
    /// use `glfw.Window.hintString`
    wayland_app_id = 0x00026001,
};

pub const WindowHintValue = extern union {
    boolean: bool,
    xyposition: XYPosition,
    int_or: IntOrDontCare,
    int: c_int,
    client_api: ClientAPI,
    context_creation_api: ContextCreationAPI,
    context_robustness: ContextRobustness,
    context_release_behavior: ContextReleaseBehavior,
    opengl_profile: OpenGLProfile,
};

pub const ClientAPI = enum(c_int) {
    none = 0,
    opengl = 0x00030001,
    opengl_es = 0x00030002,
};

pub const ContextCreationAPI = enum(c_int) {
    native = 0x00036001,
    egl = 0x00036002,
    osmesa = 0x00036003,
};

pub const OpenGLProfile = enum(c_int) {
    any = 0,
    core = 0x00032001,
    compat = 0x00032002,
};

pub const ContextRobustness = enum(c_int) {
    no_robustness = 0,
    no_reset_notification = 0x00031001,
    lose_context_on_reset = 0x00031002,
};

pub const ContextReleaseBehavior = enum(c_int) {
    any = 0,
    flush = 0x00035001,
    none = 0x00035002,
};

pub const IntOrDontCare = enum(c_int) {
    dont_care = -1,
    _,

    pub fn from(val: c_int) IntOrDontCare {
        return @enumFromInt(val);
    }

    pub fn to(self: IntOrDontCare) c_int {
        return @intFromEnum(self);
    }
};

pub const XYPosition = enum(c_uint) {
    any = 0x80000000,
    _,

    pub fn from(val: c_uint) XYPosition {
        return @enumFromInt(val);
    }

    pub fn to(self: XYPosition) c_uint {
        return @intFromEnum(self);
    }
};
