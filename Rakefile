require 'rspec/core/rake_task'

task :test do
  RSpec::Core::RakeTask.new(:test)  do |t|
    t.pattern = FileList['/spec/**/*_spec.rb']
    t.rspec_opts = '--color'
  end
end

require 'rubygems'
require 'bundler/setup'
require 'rakeup'

RakeUp::ServerTask.new do |t|
  t.port = 4567
  t.pid_file = 'tmp/server.pid'
  t.rackup_file = 'config.ru'
  t.server = :WEBrick # Or puma, mongrel, etc.
end