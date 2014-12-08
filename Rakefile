task :bundle_install do
  system 'bundle install'
end

desc "starts the rack server and runs the tests"
task :test => :bundle_install do
  system 'rackup -p 4567 -D'

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:test)  do |t|
    t.pattern = FileList['/spec/**/*_spec.rb']
    t.rspec_opts = '--color'
  end
end