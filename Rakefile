require 'rspec/core/rake_task'
require './app/main.rb'

task :default do |t, args|
  main
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/specs.rb'
end
