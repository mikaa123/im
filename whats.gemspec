Gem::Specification.new do |spec|
  spec.name = 'whats'
  spec.author = 'Michael Sokol'
  spec.email = 'mikaa123@gmail.com'
  spec.homepage = 'http://github.com/mikaa123/whats'
  spec.version = '0.1'
  spec.summary = 'A persistant hash to use as a memo in your terminal'
  spec.files = %w[
    Rakefile
    README.md
    lib/whats.rb
    lib/whats/option.rb
    lib/whats/runner.rb
    bin/whats
    test/whats_test.rb
    test/option_test.rb
  ]
  spec.test_files = %w[
    test/whats_test.rb
    test/option_test.rb
  ]
  spec.executables = ['whats']
end
