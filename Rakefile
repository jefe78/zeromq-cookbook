#!/usr/bin/env rake

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  $stderr.puts "WARNING: Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end
