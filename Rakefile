# Copyright (C) 2009 Jan Dvorak <jan.dvorak@kraxnet.cz>
#
# This software is provided 'as-is', without any express or implied
# warranty. In no event will the authors be held liable for any damages
# arising from the use of this software.
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
#  1. The origin of this software must not be misrepresented; you must not
#  claim that you wrote the original software. If you use this software
#  in a product, an acknowledgment in the product documentation would be
#  appreciated but is not required.
#
#  2. Altered source versions must be plainly marked as such, and must not be
#  misrepresented as being the original software.
#
#  3. This notice may not be removed or altered from any source distribution.

require 'rubygems/package_task'
require 'rdoc/task'
require 'rake/extensiontask'

# build documentation
rd = RDoc::Task.new do |rdoc|
  rdoc.main = "README.API"
  rdoc.title    = "GLFW bindings for Ruby"
  rdoc.rdoc_files.include('README.API', 'ext/glfw/glfw.c')
end

# Define the files that will go into the gem
gem_files = FileList["{lib,ext,examples,glfw-src,website}/**/*","README.md"]
gem_files = gem_files.exclude("**/*.so",
                              "**/*.o{,bj}",
                              "examples/**/*",
                              "ext/glfw/*.log",
                              "ext/glfw/Rakefile",
                              "glfw-src/docs/**/*",
                              "glfw-src/support/**/*",
                              "**/*.app/**/*",
                              "**/*.dSYM/**/*",
                              "**/*.dSYM",
                              "**/*.app",
                              "**/*.dylib")

spec = Gem::Specification.new do |s|
  s.name              = "ruby-glfw"
  s.version           = "0.9.3"
  s.authors           = ["Jan Dvorak", "Noel Cower", "Blaž Hrastnik"]
  s.email             = ["jan.dvorak@kraxnet.cz", "ncower@gmail.com", "speed.the.bboy@gmail.com"]
  s.homepage          = "https://github.com/archSeer/glfw"
  s.summary           = "GLFW library bindings for Ruby"
  s.require_path      = "lib"
  s.has_rdoc          = true
  s.rdoc_options      << '--main' << rd.main << '--title' << rd.title
  s.extra_rdoc_files  = rd.rdoc_files
  s.files             = gem_files
  s.platform          = Gem::Platform::RUBY
  s.extensions        << 'Rakefile'

  s.add_dependency("rake")
end

# Create a task for creating a ruby gem
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
  pkg.need_tar = true
end

Rake::ExtensionTask.new 'glfw', spec

task :test => :compile

task :default => :compile