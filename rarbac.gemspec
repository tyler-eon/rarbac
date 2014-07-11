$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rarbac/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rarbac"
  s.version     = Rarbac::VERSION
  s.authors     = ["Tyler Margison"]
  s.email       = "kolorahl@gmail.com"
  s.homepage    = "TODO"
  s.summary     = "RBAC for Rails"
  s.description = "An implementation of RBAC as a Rails engine/plugin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
end
