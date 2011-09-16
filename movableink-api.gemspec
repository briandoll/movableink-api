# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "movableink-api/version"

Gem::Specification.new do |s|
  s.name        = "movableink-api"
  s.version     = Movableink::Api::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Doll"]
  s.email       = ["brian@emphaticsolutions.com"]
  s.homepage    = "http://emphaticsolutions.com/"
  s.summary     = %q{Ruby library to provide easy integration with the movableink.com API}
  s.description = %q{Ruby library to provide easy integration with the movableink.com API}
  s.add_dependency('crack', '>= 0.1.8')
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
