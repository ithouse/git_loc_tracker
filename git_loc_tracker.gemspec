# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "git_loc_tracker/version"

Gem::Specification.new do |s|
  s.name        = "git_loc_tracker"
  s.version     = GitLocTracker::VERSION
  s.authors     = ["ITHouse (Latvia) and Janis Kesteris"]
  s.email       = ["support@ithouse.lv"]
  s.homepage    = "https://github.com/ithouse/git_loc_tracker"
  s.summary     = %q{Counts new, deleted and modified lines in git repository with ability to pass various options}
  s.description = %q{Counts new, deleted and modified lines in git repository with ability to pass various options}

  s.rubyforge_project = "git_loc_tracker"

  s.files         = Dir["{bin,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files    = Dir["spec/**/*"]
  s.executables   = "git-loc-tracker"
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "systemu", "~> 2.5.2"
end
