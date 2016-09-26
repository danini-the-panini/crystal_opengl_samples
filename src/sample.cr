require "lib_gl"
require "glfw"

window = GLFW::Window.new(800, 600, "Hello, Crystal!")

window.make_current

GLFW.swap_interval = 1

until window.should_close?
  fb_size = window.framebuffer_size
  ratio = fb_size[:width].to_f / fb_size[:height].to_f

  LibGL.viewport(0, 0, fb_size[:width], fb_size[:height])
  LibGL.clear(LibGL::COLOR_BUFFER_BIT)
  LibGL.matrixMode(LibGL::PROJECTION)
  LibGL.loadIdentity()
  LibGL.ortho(-ratio, ratio, -1.0, 1.0, 1.0, -1.0)
  LibGL.matrixMode(LibGL::MODELVIEW)

  LibGL.loadIdentity()
  LibGL.rotatef(GLFW.time * 50.0, 0.0, 0.0, 1.0)

  LibGL.begin(LibGL::TRIANGLES)
  LibGL.color3f(1.0, 0.0, 0.0)
  LibGL.vertex3f(-0.6, -0.4, 0.0)
  LibGL.color3f(0.0, 1.0, 0.0)
  LibGL.vertex3f(0.6, -0.4, 0.0)
  LibGL.color3f(0.0, 0.0, 1.0)
  LibGL.vertex3f(0.0, 0.6, 0.0)
  LibGL.end()

  window.swap_buffers
  GLFW.poll_for_events
end
