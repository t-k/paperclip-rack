require "bundler/gem_tasks"

require "rake/testtask"

desc 'Test'
Rake::TestTask.new(:test) do |t|
  # t.libs << 'lib' << 'profile'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end