require 'mkmf'

if have_library('glfw', 'glfwInit') || have_library('glfw32.lib', 'glfwInit')
  create_header
  create_makefile('glfw')
end