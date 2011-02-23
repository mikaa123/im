require 'rake/testtask'

Rake::TestTask.new do |t|
    t.test_files = FileList['test/*_test.rb']
    t.verbose = true
end

task "run" do
  puts `ruby -I lib bin/memo -a Mika -m "C'est moi"`
end

