# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hike}
  s.version = "1.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sam Stephenson"]
  s.date = %q{2013-06-04}
  s.description = %q{A Ruby library for finding files in a set of paths.}
  s.email = ["sstephenson@gmail.com"]
  s.files = ["README.md", "LICENSE", "lib/hike/extensions.rb", "lib/hike/index.rb", "lib/hike/normalized_array.rb", "lib/hike/paths.rb", "lib/hike/trail.rb", "lib/hike.rb"]
  s.homepage = %q{http://github.com/sstephenson/hike}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Find files in a set of paths}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
