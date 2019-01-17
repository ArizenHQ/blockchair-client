require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# Prevents from pushing this private gem
ENV['gem_push'] = 'off'