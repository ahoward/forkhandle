## forkhandle.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "forkhandle"
  spec.version = "0.0.3"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "forkhandle"
  spec.description = "a teeny library / design pattern for managing connections in a process and thread safe fashion"
  spec.license = "same as ruby's"

  spec.files =
["README.md", "Rakefile", "forkhandle.gemspec", "lib", "lib/forkhandle.rb"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

  

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/forkhandle"
end
