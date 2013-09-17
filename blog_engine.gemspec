$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog_engine"
  s.version     = BlogEngine::VERSION
  s.authors     = ["Robert Huberdeau"]
  s.email       = ["rhuberdeau@gmail.com"]
  s.homepage    = "http://www.github.com/rhuberdeau/Blog-Engine"
  s.summary     = "Blog Engine"
  s.description = "Blog Engine."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'bootstrap-wysihtml5-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'bootstrap-sass'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency 'devise'
  s.add_development_dependency 'launchy'
end
