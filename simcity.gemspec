# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "simcity"
  s.version     = 0.0.1
  s.authors     = ["Adam Gamble", "Josh Adams"]
  s.email       = ["agamble@isotope11.com", "josh@isotope11.com"]
  s.homepage    = "http://github.com/isotope11/simcity"
  s.summary     = %q{A simulation toy}
  s.description = %q{A simulation toy}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "pry"
  s.add_development_dependency "rspec"

  s.add_runtime_dependency "celluloid"
end
