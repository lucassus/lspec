# -*- encoding: utf-8 -*-
$: << File.expand_path("../lib", __FILE__)

require "lspec/version"

Gem::Specification.new do |s|
  s.name        = "lspec"
  s.version     = LSpec::VERSION
  s.authors     = ["Łukasz Bandzarewicz"]
  s.email       = ["lucassus@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "lspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-shell'
end
