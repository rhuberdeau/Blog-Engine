$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog_engine"
  s.version     = BlogEngine::VERSION
  s.authors     = ["Robert Huberdeau"]
  s.email       = ["rhuberdeau@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BlogEngine."
  s.description = "TODO: Description of BlogEngine."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl"
end