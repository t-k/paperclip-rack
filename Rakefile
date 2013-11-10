require "bundler/gem_tasks"

require "rake/testtask"

desc "default task"
task :default => [:test]

desc 'Test'
Rake::TestTask.new(:test) do |t|
  t.pattern = "test/**/*_test.rb"
  t.verbose = true
end