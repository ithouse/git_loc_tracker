# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "git_loc_tracker/version"

Gem::Specification.new do |s|
  s.name        = "git_loc_tracker"
  s.version     = GitLocTracker::VERSION
  s.authors     = ["ITHouse (Latvia) and Janis Kesteris"]
  s.email       = ["janisk@ithouse.lv"]
  s.homepage    = "https://github.com/Janziz/git_loc_tracker"
  s.summary     = %q{Counts new, deleted and modified lines in git repository with ability to pass various options}
  s.description = %q{Counts new, deleted and modified lines in git repository with ability to pass various options}

  #s.rubyforge_project = "git_loc_tracker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "debugger"
  s.add_runtime_dependency "systemu", "~> 2.5.2"
end
