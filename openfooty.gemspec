# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "openfooty/version"

Gem::Specification.new do |s|
  s.name        = "openfooty"
  s.version     = Openfooty::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Johnny Khai Nguyen"]
  s.email       = ["johnnyn@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby wrapper for the OpenFooty API}
  s.description = %q{Use this gem in your Ruby application to access the OpenFooty API}

  s.rubyforge_project = "openfooty"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'httparty'
  s.add_dependency 'hashie'  
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'vcr'
end
