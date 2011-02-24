$:.push File.expand_path('../lib', __FILE__)
require 'im/version'

Gem::Specification.new do |spec|
  spec.name = 'im'
  spec.author = 'Michael Sokol'
  spec.email = 'mikaa123@gmail.com'
  spec.homepage = 'http://github.com/mikaa123/im'
  spec.version = Im::VERSION
  spec.summary = "A tool to document what you are doing in your project"
  spec.files = %w[
    Rakefile
    README.md
    lib/im.rb
    lib/im/application.rb
    lib/im/meta.rb
    lib/im/entry.rb
    lib/im/version.rb
    bin/im
    test/meta_test.rb
    test/application_test.rb
  ]
  spec.test_files = %w[
    test/application_test.rb
    test/meta_test.rb
  ]
  spec.executables = ['im']
end
