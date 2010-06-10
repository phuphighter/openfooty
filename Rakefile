# require "mg"
# 
# MG.new("openfooty.gemspec")

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "openfooty"
    gem.summary = %Q{Ruby wrapper for the Openfooty API}
    gem.description = %Q{Ruby wrapper for the Openfooty API}
    gem.email = "johnnyn@gmail.com"
    gem.homepage = "http://github.com/phuphighter/openfooty"
    gem.authors = ["Johnny Khai Nguyen"]
    
    gem.add_dependency('httparty', '>= 0.5.0')
    gem.add_dependency('hashie', '>= 0.1.3')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.ruby_opts = ['-rubygems'] if defined? Gem
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
end

desc "Run tests"
task :default => :test