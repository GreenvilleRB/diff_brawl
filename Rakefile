require 'rspec/core/rake_task'
require 'difftastic'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end

desc 'Raw ouput of compare method'
task :raw_output do
  puts Difftastic.new.compare("examples/file_1.rb","examples/file_2.rb")
end

desc 'Pretty print output'
task :output do
  d = Difftastic.new
  d.compare("examples/file_1.rb","examples/file_2.rb")
  puts d.write
end
