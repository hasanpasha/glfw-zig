const std = @import("std");
const zeroes = std.mem.zeroes;
const promoteIntLiteral = std.zig.c_translation.promoteIntLiteral;

pub const GLFWglproc = ?*const fn () callconv(.c) void;
pub const GLFWvkproc = ?*const fn () callconv(.c) void;

pub const Monitorfun = ?*const fn (?*Monitor, c_int) callconv(.c) void;

pub const Monitor = opaque {
    pub extern fn glfwGetMonitors(count: [*c]c_int) [*c]?*Monitor;
    pub extern fn glfwGetPrimaryMonitor() ?*Monitor;
    pub extern fn glfwGetMonitorPos(monitor: ?*Monitor, xpos: [*c]c_int, ypos: [*c]c_int) void;
    pub extern fn glfwGetMonitorWorkarea(monitor: ?*Monitor, xpos: [*c]c_int, ypos: [*c]c_int, width: [*c]c_int, height: [*c]c_int) void;
    pub extern fn glfwGetMonitorPhysicalSize(monitor: ?*Monitor, widthMM: [*c]c_int, heightMM: [*c]c_int) void;
    pub extern fn glfwGetMonitorContentScale(monitor: ?*Monitor, xscale: [*c]f32, yscale: [*c]f32) void;
    pub extern fn glfwGetMonitorName(monitor: ?*Monitor) [*c]const u8;
    pub extern fn glfwSetMonitorUserPointer(monitor: ?*Monitor, pointer: ?*anyopaque) void;
    pub extern fn glfwGetMonitorUserPointer(monitor: ?*Monitor) ?*anyopaque;
    pub extern fn glfwSetMonitorCallback(callback: Monitorfun) Monitorfun;
    pub extern fn glfwGetVideoModes(monitor: ?*Monitor, count: [*c]c_int) [*c]const Vidmode;
    pub extern fn glfwGetVideoMode(monitor: ?*Monitor) [*c]const Vidmode;
    pub extern fn glfwSetGamma(monitor: ?*Monitor, gamma: f32) void;
    pub extern fn glfwGetGammaRamp(monitor: ?*Monitor) [*c]const Gammaramp;
    pub extern fn glfwSetGammaRamp(monitor: ?*Monitor, ramp: [*c]const Gammaramp) void;
};

pub const Windowposfun = ?*const fn (window: ?*Window, xpos: c_int, ypos: c_int) callconv(.c) void;
pub const Windowsizefun = ?*const fn (window: ?*Window, width: c_int, height: c_int) callconv(.c) void;
pub const Windowclosefun = ?*const fn (window: ?*Window) callconv(.c) void;
pub const Windowrefreshfun = ?*const fn (window: ?*Window) callconv(.c) void;
pub const Windowfocusfun = ?*const fn (window: ?*Window, focused: c_int) callconv(.c) void;
pub const Windowiconifyfun = ?*const fn (window: ?*Window, iconified: c_int) callconv(.c) void;
pub const Windowmaximizefun = ?*const fn (window: ?*Window, maximized: c_int) callconv(.c) void;
pub const Framebuffersizefun = ?*const fn (window: ?*Window, width: c_int, height: c_int) callconv(.c) void;
pub const Windowcontentscalefun = ?*const fn (window: ?*Window, xscale: f32, yscale: f32) callconv(.c) void;
pub const Mousebuttonfun = ?*const fn (window: ?*Window, button: c_int, action: c_int, mods: c_int) callconv(.c) void;
pub const Cursorposfun = ?*const fn (window: ?*Window, xpos: f64, ypos: f64) callconv(.c) void;
pub const Cursorenterfun = ?*const fn (window: ?*Window, entered: c_int) callconv(.c) void;
pub const Scrollfun = ?*const fn (window: ?*Window, xoffset: f64, yoffset: f64) callconv(.c) void;
pub const Keyfun = ?*const fn (window: ?*Window, key: Key, scancode: c_int, action: KeyAction, mods: Mods) callconv(.c) void;
pub const Charfun = ?*const fn (window: ?*Window, codepoint: c_uint) callconv(.c) void;
pub const Charmodsfun = ?*const fn (window: ?*Window, codepoint: c_uint, mods: c_int) callconv(.c) void;
pub const Dropfun = ?*const fn (window: ?*Window, path_count: c_int, paths: [*c][*c]const u8) callconv(.c) void;

pub const Window = opaque {
    extern fn glfwDefaultWindowHints() void;
    pub const defaultHints = glfwDefaultWindowHints;

    extern fn glfwWindowHint(hint: c_int, value: c_int) void;
    pub const hint = glfwWindowHint;

    extern fn glfwWindowHintString(hint: c_int, value: [*c]const u8) void;
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

    extern fn glfwGetWindowAttrib(window: *Window, attrib: c_int) c_int;
    pub const getAttrib = glfwGetWindowAttrib;

    extern fn glfwSetWindowAttrib(window: *Window, attrib: c_int, value: c_int) void;
    pub const setAttrib = glfwSetWindowAttrib;

    extern fn glfwSetWindowUserPointer(window: *Window, pointer: ?*anyopaque) void;
    pub const setUserPointer = glfwSetWindowUserPointer;

    extern fn glfwGetWindowUserPointer(window: *Window) ?*anyopaque;
    pub const getUserPointer = glfwGetWindowUserPointer;

    extern fn glfwGetInputMode(window: *Window, mode: c_int) c_int;
    pub const getInputMode = glfwGetInputMode;

    extern fn glfwSetInputMode(window: *Window, mode: c_int, value: c_int) void;
    pub const setInputMode = glfwSetInputMode;

    extern fn glfwGetKey(window: *Window, key: Key) KeyAction;
    pub const getKey = glfwGetKey;

    extern fn glfwGetMouseButton(window: *Window, button: c_int) c_int;
    pub const getMouseButton = glfwGetMouseButton;

    extern fn glfwGetCursorPos(window: *Window, xpos: ?*f64, ypos: ?*f64) void;
    pub const getCursorPos = glfwGetCursorPos;

    extern fn glfwSetCursorPos(window: *Window, xpos: f64, ypos: f64) void;
    pub const setCursorPos = glfwSetCursorPos;

    extern fn glfwSetCursor(window: *Window, cursor: ?*Cursor) void;
    pub const setCursor = glfwSetCursor;

    extern fn glfwSetClipboardString(window: *Window, string: [*:0]const u8) void;
    pub const setClipboardString = glfwSetClipboardString;

    extern fn glfwGetClipboardString(window: *Window) [*:0]const u8;
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
pub const Joystickfun = ?*const fn (jid: c_int, event: c_int) callconv(.c) void;

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
    buttons: [15]u8 = zeroes([15]u8),
    axes: [6]f32 = zeroes([6]f32),
};

extern fn glfwInit() bool;
pub const init = glfwInit;

extern fn glfwTerminate() void;
pub const terminate = glfwTerminate;

extern fn glfwInitHint(hint: c_int, value: c_int) void;
pub const initHint = glfwInitHint;

extern fn glfwGetVersion(major: ?*c_int, minor: ?*c_int, rev: ?*c_int) void;
pub const getVersion = glfwGetVersion;

extern fn glfwGetVersionString() [*:0]const u8;
pub const getVersionString = glfwGetVersionString;

extern fn glfwGetError(description: ?*?[*:0]const u8) Error;
pub const getError = glfwGetError;

extern fn glfwSetErrorCallback(callback: Errorfun) Errorfun;
pub const setErrorCallback = glfwSetErrorCallback;

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

pub extern fn glfwJoystickPresent(jid: c_int) c_int;
pub extern fn glfwGetJoystickAxes(jid: c_int, count: [*c]c_int) [*c]const f32;
pub extern fn glfwGetJoystickButtons(jid: c_int, count: [*c]c_int) [*c]const u8;
pub extern fn glfwGetJoystickHats(jid: c_int, count: [*c]c_int) [*c]const u8;
pub extern fn glfwGetJoystickName(jid: c_int) [*c]const u8;
pub extern fn glfwGetJoystickGUID(jid: c_int) [*c]const u8;
pub extern fn glfwSetJoystickUserPointer(jid: c_int, pointer: ?*anyopaque) void;
pub extern fn glfwGetJoystickUserPointer(jid: c_int) ?*anyopaque;
pub extern fn glfwJoystickIsGamepad(jid: c_int) c_int;
pub extern fn glfwSetJoystickCallback(callback: Joystickfun) Joystickfun;
pub extern fn glfwUpdateGamepadMappings(string: [*c]const u8) c_int;
pub extern fn glfwGetGamepadName(jid: c_int) [*c]const u8;
pub extern fn glfwGetGamepadState(jid: c_int, state: [*c]Gamepadstate) c_int;

pub extern fn glfwGetTime() f64;
pub extern fn glfwSetTime(time: f64) void;
pub extern fn glfwGetTimerValue() u64;
pub extern fn glfwGetTimerFrequency() u64;

pub extern fn glfwSwapInterval(interval: c_int) void;
pub extern fn glfwExtensionSupported(extension: [*c]const u8) c_int;
pub extern fn glfwGetProcAddress(procname: [*c]const u8) GLFWglproc;
pub extern fn glfwVulkanSupported() c_int;
pub extern fn glfwGetRequiredInstanceExtensions(count: [*c]u32) [*c][*c]const u8;

pub const KeyAction = enum(c_int) {
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
};

pub const Bool = enum(c_int) {
    true = 1,
    false = 0,
};

pub const GLFW_VERSION_MAJOR = @as(c_int, 3);
pub const GLFW_VERSION_MINOR = @as(c_int, 3);
pub const GLFW_VERSION_REVISION = @as(c_int, 10);

pub const GLFW_TRUE = @as(c_int, 1);
pub const GLFW_FALSE = @as(c_int, 0);

pub const GLFW_HAT_CENTERED = @as(c_int, 0);
pub const GLFW_HAT_UP = @as(c_int, 1);
pub const GLFW_HAT_RIGHT = @as(c_int, 2);
pub const GLFW_HAT_DOWN = @as(c_int, 4);
pub const GLFW_HAT_LEFT = @as(c_int, 8);
pub const GLFW_HAT_RIGHT_UP = GLFW_HAT_RIGHT | GLFW_HAT_UP;
pub const GLFW_HAT_RIGHT_DOWN = GLFW_HAT_RIGHT | GLFW_HAT_DOWN;
pub const GLFW_HAT_LEFT_UP = GLFW_HAT_LEFT | GLFW_HAT_UP;
pub const GLFW_HAT_LEFT_DOWN = GLFW_HAT_LEFT | GLFW_HAT_DOWN;

pub const GLFW_MOUSE_BUTTON_1 = @as(c_int, 0);
pub const GLFW_MOUSE_BUTTON_2 = @as(c_int, 1);
pub const GLFW_MOUSE_BUTTON_3 = @as(c_int, 2);
pub const GLFW_MOUSE_BUTTON_4 = @as(c_int, 3);
pub const GLFW_MOUSE_BUTTON_5 = @as(c_int, 4);
pub const GLFW_MOUSE_BUTTON_6 = @as(c_int, 5);
pub const GLFW_MOUSE_BUTTON_7 = @as(c_int, 6);
pub const GLFW_MOUSE_BUTTON_8 = @as(c_int, 7);
pub const GLFW_MOUSE_BUTTON_LAST = GLFW_MOUSE_BUTTON_8;
pub const GLFW_MOUSE_BUTTON_LEFT = GLFW_MOUSE_BUTTON_1;
pub const GLFW_MOUSE_BUTTON_RIGHT = GLFW_MOUSE_BUTTON_2;
pub const GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3;

pub const GLFW_JOYSTICK_1 = @as(c_int, 0);
pub const GLFW_JOYSTICK_2 = @as(c_int, 1);
pub const GLFW_JOYSTICK_3 = @as(c_int, 2);
pub const GLFW_JOYSTICK_4 = @as(c_int, 3);
pub const GLFW_JOYSTICK_5 = @as(c_int, 4);
pub const GLFW_JOYSTICK_6 = @as(c_int, 5);
pub const GLFW_JOYSTICK_7 = @as(c_int, 6);
pub const GLFW_JOYSTICK_8 = @as(c_int, 7);
pub const GLFW_JOYSTICK_9 = @as(c_int, 8);
pub const GLFW_JOYSTICK_10 = @as(c_int, 9);
pub const GLFW_JOYSTICK_11 = @as(c_int, 10);
pub const GLFW_JOYSTICK_12 = @as(c_int, 11);
pub const GLFW_JOYSTICK_13 = @as(c_int, 12);
pub const GLFW_JOYSTICK_14 = @as(c_int, 13);
pub const GLFW_JOYSTICK_15 = @as(c_int, 14);
pub const GLFW_JOYSTICK_16 = @as(c_int, 15);
pub const GLFW_JOYSTICK_LAST = GLFW_JOYSTICK_16;

pub const GLFW_GAMEPAD_BUTTON_A = @as(c_int, 0);
pub const GLFW_GAMEPAD_BUTTON_B = @as(c_int, 1);
pub const GLFW_GAMEPAD_BUTTON_X = @as(c_int, 2);
pub const GLFW_GAMEPAD_BUTTON_Y = @as(c_int, 3);
pub const GLFW_GAMEPAD_BUTTON_LEFT_BUMPER = @as(c_int, 4);
pub const GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = @as(c_int, 5);
pub const GLFW_GAMEPAD_BUTTON_BACK = @as(c_int, 6);
pub const GLFW_GAMEPAD_BUTTON_START = @as(c_int, 7);
pub const GLFW_GAMEPAD_BUTTON_GUIDE = @as(c_int, 8);
pub const GLFW_GAMEPAD_BUTTON_LEFT_THUMB = @as(c_int, 9);
pub const GLFW_GAMEPAD_BUTTON_RIGHT_THUMB = @as(c_int, 10);
pub const GLFW_GAMEPAD_BUTTON_DPAD_UP = @as(c_int, 11);
pub const GLFW_GAMEPAD_BUTTON_DPAD_RIGHT = @as(c_int, 12);
pub const GLFW_GAMEPAD_BUTTON_DPAD_DOWN = @as(c_int, 13);
pub const GLFW_GAMEPAD_BUTTON_DPAD_LEFT = @as(c_int, 14);
pub const GLFW_GAMEPAD_BUTTON_LAST = GLFW_GAMEPAD_BUTTON_DPAD_LEFT;
pub const GLFW_GAMEPAD_BUTTON_CROSS = GLFW_GAMEPAD_BUTTON_A;
pub const GLFW_GAMEPAD_BUTTON_CIRCLE = GLFW_GAMEPAD_BUTTON_B;
pub const GLFW_GAMEPAD_BUTTON_SQUARE = GLFW_GAMEPAD_BUTTON_X;
pub const GLFW_GAMEPAD_BUTTON_TRIANGLE = GLFW_GAMEPAD_BUTTON_Y;
pub const GLFW_GAMEPAD_AXIS_LEFT_X = @as(c_int, 0);
pub const GLFW_GAMEPAD_AXIS_LEFT_Y = @as(c_int, 1);
pub const GLFW_GAMEPAD_AXIS_RIGHT_X = @as(c_int, 2);
pub const GLFW_GAMEPAD_AXIS_RIGHT_Y = @as(c_int, 3);
pub const GLFW_GAMEPAD_AXIS_LEFT_TRIGGER = @as(c_int, 4);
pub const GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = @as(c_int, 5);
pub const GLFW_GAMEPAD_AXIS_LAST = GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER;

pub const GLFW_FOCUSED = promoteIntLiteral(c_int, 0x00020001, .hex);
pub const GLFW_ICONIFIED = promoteIntLiteral(c_int, 0x00020002, .hex);
pub const GLFW_RESIZABLE = promoteIntLiteral(c_int, 0x00020003, .hex);
pub const GLFW_VISIBLE = promoteIntLiteral(c_int, 0x00020004, .hex);
pub const GLFW_DECORATED = promoteIntLiteral(c_int, 0x00020005, .hex);
pub const GLFW_AUTO_ICONIFY = promoteIntLiteral(c_int, 0x00020006, .hex);
pub const GLFW_FLOATING = promoteIntLiteral(c_int, 0x00020007, .hex);
pub const GLFW_MAXIMIZED = promoteIntLiteral(c_int, 0x00020008, .hex);
pub const GLFW_CENTER_CURSOR = promoteIntLiteral(c_int, 0x00020009, .hex);
pub const GLFW_TRANSPARENT_FRAMEBUFFER = promoteIntLiteral(c_int, 0x0002000A, .hex);
pub const GLFW_HOVERED = promoteIntLiteral(c_int, 0x0002000B, .hex);
pub const GLFW_FOCUS_ON_SHOW = promoteIntLiteral(c_int, 0x0002000C, .hex);
pub const GLFW_RED_BITS = promoteIntLiteral(c_int, 0x00021001, .hex);
pub const GLFW_GREEN_BITS = promoteIntLiteral(c_int, 0x00021002, .hex);
pub const GLFW_BLUE_BITS = promoteIntLiteral(c_int, 0x00021003, .hex);
pub const GLFW_ALPHA_BITS = promoteIntLiteral(c_int, 0x00021004, .hex);
pub const GLFW_DEPTH_BITS = promoteIntLiteral(c_int, 0x00021005, .hex);
pub const GLFW_STENCIL_BITS = promoteIntLiteral(c_int, 0x00021006, .hex);
pub const GLFW_ACCUM_RED_BITS = promoteIntLiteral(c_int, 0x00021007, .hex);
pub const GLFW_ACCUM_GREEN_BITS = promoteIntLiteral(c_int, 0x00021008, .hex);
pub const GLFW_ACCUM_BLUE_BITS = promoteIntLiteral(c_int, 0x00021009, .hex);
pub const GLFW_ACCUM_ALPHA_BITS = promoteIntLiteral(c_int, 0x0002100A, .hex);
pub const GLFW_AUX_BUFFERS = promoteIntLiteral(c_int, 0x0002100B, .hex);
pub const GLFW_STEREO = promoteIntLiteral(c_int, 0x0002100C, .hex);
pub const GLFW_SAMPLES = promoteIntLiteral(c_int, 0x0002100D, .hex);
pub const GLFW_SRGB_CAPABLE = promoteIntLiteral(c_int, 0x0002100E, .hex);
pub const GLFW_REFRESH_RATE = promoteIntLiteral(c_int, 0x0002100F, .hex);
pub const GLFW_DOUBLEBUFFER = promoteIntLiteral(c_int, 0x00021010, .hex);
pub const GLFW_CLIENT_API = promoteIntLiteral(c_int, 0x00022001, .hex);
pub const GLFW_CONTEXT_VERSION_MAJOR = promoteIntLiteral(c_int, 0x00022002, .hex);
pub const GLFW_CONTEXT_VERSION_MINOR = promoteIntLiteral(c_int, 0x00022003, .hex);
pub const GLFW_CONTEXT_REVISION = promoteIntLiteral(c_int, 0x00022004, .hex);
pub const GLFW_CONTEXT_ROBUSTNESS = promoteIntLiteral(c_int, 0x00022005, .hex);
pub const GLFW_OPENGL_FORWARD_COMPAT = promoteIntLiteral(c_int, 0x00022006, .hex);
pub const GLFW_OPENGL_DEBUG_CONTEXT = promoteIntLiteral(c_int, 0x00022007, .hex);
pub const GLFW_OPENGL_PROFILE = promoteIntLiteral(c_int, 0x00022008, .hex);
pub const GLFW_CONTEXT_RELEASE_BEHAVIOR = promoteIntLiteral(c_int, 0x00022009, .hex);
pub const GLFW_CONTEXT_NO_ERROR = promoteIntLiteral(c_int, 0x0002200A, .hex);
pub const GLFW_CONTEXT_CREATION_API = promoteIntLiteral(c_int, 0x0002200B, .hex);
pub const GLFW_SCALE_TO_MONITOR = promoteIntLiteral(c_int, 0x0002200C, .hex);
pub const GLFW_COCOA_RETINA_FRAMEBUFFER = promoteIntLiteral(c_int, 0x00023001, .hex);
pub const GLFW_COCOA_FRAME_NAME = promoteIntLiteral(c_int, 0x00023002, .hex);
pub const GLFW_COCOA_GRAPHICS_SWITCHING = promoteIntLiteral(c_int, 0x00023003, .hex);
pub const GLFW_X11_CLASS_NAME = promoteIntLiteral(c_int, 0x00024001, .hex);
pub const GLFW_X11_INSTANCE_NAME = promoteIntLiteral(c_int, 0x00024002, .hex);
pub const GLFW_NO_API = @as(c_int, 0);
pub const GLFW_OPENGL_API = promoteIntLiteral(c_int, 0x00030001, .hex);
pub const GLFW_OPENGL_ES_API = promoteIntLiteral(c_int, 0x00030002, .hex);
pub const GLFW_NO_ROBUSTNESS = @as(c_int, 0);
pub const GLFW_NO_RESET_NOTIFICATION = promoteIntLiteral(c_int, 0x00031001, .hex);
pub const GLFW_LOSE_CONTEXT_ON_RESET = promoteIntLiteral(c_int, 0x00031002, .hex);
pub const GLFW_OPENGL_ANY_PROFILE = @as(c_int, 0);
pub const GLFW_OPENGL_CORE_PROFILE = promoteIntLiteral(c_int, 0x00032001, .hex);
pub const GLFW_OPENGL_COMPAT_PROFILE = promoteIntLiteral(c_int, 0x00032002, .hex);
pub const GLFW_CURSOR = promoteIntLiteral(c_int, 0x00033001, .hex);
pub const GLFW_STICKY_KEYS = promoteIntLiteral(c_int, 0x00033002, .hex);
pub const GLFW_STICKY_MOUSE_BUTTONS = promoteIntLiteral(c_int, 0x00033003, .hex);
pub const GLFW_LOCK_KEY_MODS = promoteIntLiteral(c_int, 0x00033004, .hex);
pub const GLFW_RAW_MOUSE_MOTION = promoteIntLiteral(c_int, 0x00033005, .hex);
pub const GLFW_CURSOR_NORMAL = promoteIntLiteral(c_int, 0x00034001, .hex);
pub const GLFW_CURSOR_HIDDEN = promoteIntLiteral(c_int, 0x00034002, .hex);
pub const GLFW_CURSOR_DISABLED = promoteIntLiteral(c_int, 0x00034003, .hex);
pub const GLFW_ANY_RELEASE_BEHAVIOR = @as(c_int, 0);
pub const GLFW_RELEASE_BEHAVIOR_FLUSH = promoteIntLiteral(c_int, 0x00035001, .hex);
pub const GLFW_RELEASE_BEHAVIOR_NONE = promoteIntLiteral(c_int, 0x00035002, .hex);
pub const GLFW_NATIVE_CONTEXT_API = promoteIntLiteral(c_int, 0x00036001, .hex);
pub const GLFW_EGL_CONTEXT_API = promoteIntLiteral(c_int, 0x00036002, .hex);
pub const GLFW_OSMESA_CONTEXT_API = promoteIntLiteral(c_int, 0x00036003, .hex);
pub const GLFW_WAYLAND_PREFER_LIBDECOR = promoteIntLiteral(c_int, 0x00038001, .hex);
pub const GLFW_WAYLAND_DISABLE_LIBDECOR = promoteIntLiteral(c_int, 0x00038002, .hex);
pub const GLFW_CONNECTED = promoteIntLiteral(c_int, 0x00040001, .hex);
pub const GLFW_DISCONNECTED = promoteIntLiteral(c_int, 0x00040002, .hex);
pub const GLFW_JOYSTICK_HAT_BUTTONS = promoteIntLiteral(c_int, 0x00050001, .hex);
pub const GLFW_COCOA_CHDIR_RESOURCES = promoteIntLiteral(c_int, 0x00051001, .hex);
pub const GLFW_COCOA_MENUBAR = promoteIntLiteral(c_int, 0x00051002, .hex);
pub const GLFW_WAYLAND_LIBDECOR = promoteIntLiteral(c_int, 0x00053001, .hex);
pub const GLFW_DONT_CARE = -@as(c_int, 1);
