// Common GLFW types
pub const glfw = @import("glfw.zig");
pub const Monitor = glfw.Monitor;
pub const Window = glfw.Window;

// Platform-specific types
pub const HWND = *opaque {};
pub const HGLRC = *opaque {};
pub const HDC = *opaque {};
pub const CGDirectDisplayID = u32;
pub const id = *opaque {};
pub const Display = opaque {};
pub const RRCrtc = u32;
pub const RROutput = u32;
pub const WindowHandle = u32; // X11 Window
pub const GLXContext = *opaque {};
pub const GLXWindow = u32;
pub const wl_display = opaque {};
pub const wl_output = opaque {};
pub const wl_surface = opaque {};
pub const EGLDisplay = *opaque {};
pub const EGLContext = *opaque {};
pub const EGLSurface = *opaque {};
pub const OSMesaContext = *opaque {};

// Win32
extern fn glfwGetWin32Adapter(monitor: *Monitor) [*:0]const u8;
pub const getWin32Adapter = glfwGetWin32Adapter;

extern fn glfwGetWin32Monitor(monitor: *Monitor) [*:0]const u8;
pub const getWin32Monitor = glfwGetWin32Monitor;

extern fn glfwGetWin32Window(window: *Window) HWND;
pub const getWin32Window = glfwGetWin32Window;

// WGL
extern fn glfwGetWGLContext(window: *Window) HGLRC;
pub const getWGLContext = glfwGetWGLContext;

// Cocoa
extern fn glfwGetCocoaMonitor(monitor: *Monitor) CGDirectDisplayID;
pub const getCocoaMonitor = glfwGetCocoaMonitor;

extern fn glfwGetCocoaWindow(window: *Window) id;
pub const getCocoaWindow = glfwGetCocoaWindow;

// NSGL
extern fn glfwGetNSGLContext(window: *Window) id;
pub const getNSGLContext = glfwGetNSGLContext;

// X11
extern fn glfwGetX11Display() ?*Display;
pub const getX11Display = glfwGetX11Display;

extern fn glfwGetX11Adapter(monitor: *Monitor) RRCrtc;
pub const getX11Adapter = glfwGetX11Adapter;

extern fn glfwGetX11Monitor(monitor: *Monitor) RROutput;
pub const getX11Monitor = glfwGetX11Monitor;

extern fn glfwGetX11Window(window: *Window) WindowHandle;
pub const getX11Window = glfwGetX11Window;

extern fn glfwSetX11SelectionString(string: [*:0]const u8) void;
pub const SetX11SelectionString = glfwSetX11SelectionString;

extern fn glfwGetX11SelectionString() ?[*:0]const u8;
pub const getX11SelectionString = glfwGetX11SelectionString;

// GLX
extern fn glfwGetGLXContext(window: *Window) ?GLXContext;
pub const getGLXContext = glfwGetGLXContext;

extern fn glfwGetGLXWindow(window: *Window) GLXWindow;
pub const getGLXWindow = glfwGetGLXWindow;

// Wayland
extern fn glfwGetWaylandDisplay() ?*wl_display;
pub const getWaylandDisplay = glfwGetWaylandDisplay;

extern fn glfwGetWaylandMonitor(monitor: *Monitor) ?*wl_output;
pub const getWaylandMonitor = glfwGetWaylandMonitor;

extern fn glfwGetWaylandWindow(window: *Window) ?*wl_surface;
pub const getWaylandWindow = glfwGetWaylandWindow;

// EGL
extern fn glfwGetEGLDisplay() EGLDisplay;
pub const getEGLDisplay = glfwGetEGLDisplay;

extern fn glfwGetEGLContext(window: *Window) EGLContext;
pub const getEGLContext = glfwGetEGLContext;

extern fn glfwGetEGLSurface(window: *Window) EGLSurface;
pub const getEGLSurface = glfwGetEGLSurface;

// OSMesa
extern fn glfwGetOSMesaColorBuffer(window: *Window, width: ?*i32, height: ?*i32, format: ?*i32, buffer: ?*?*anyopaque) i32;
pub const getOSMesaColorBuffer = glfwGetOSMesaColorBuffer;

extern fn glfwGetOSMesaDepthBuffer(window: *Window, width: ?*i32, height: ?*i32, bytesPerValue: ?*i32, buffer: ?*?*anyopaque) i32;
pub const getOSMesaDepthBuffer = glfwGetOSMesaDepthBuffer;

extern fn glfwGetOSMesaContext(window: *Window) ?OSMesaContext;
pub const getOSMesaContext = glfwGetOSMesaContext;
