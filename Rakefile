#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ENV['RSPEC_OPTS']
end

task :test => :spec
task :default => :test

desc "Run benchmarks"
task :benchmark do
  load File.expand_path("../spec/counters_benchmark.rb", __FILE__)
end
