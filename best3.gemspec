#-*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "best3"

Gem::Specification.new do |s|
  s.name        = "best3"
  s.version     = Best3::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.2"
  s.authors     = ["Ryan Allen"]
  s.email       = ["ryan@ryanface.com"]
  s.homepage    = "https://github.com/ryan-allen/best3"
  s.summary     = %q{Minimal library for interacting with the Amazon Web Service API.}
  s.description = %q{Are you depressed? Has high interest rates got you down? My name is Meatwad and today I'm here to offer you a once in a lifetime opportunity. Sell your organs, live, over the internet. Get money back on your baby!}

  s.rubyforge_project = "best3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('bundler')
  s.add_dependency('typhoeus')
  s.add_dependency('nokogiri')
end
