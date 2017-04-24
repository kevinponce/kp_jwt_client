$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kp_jwt_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kp_jwt_client"
  s.version     = KpJwtClient::VERSION
  s.authors     = ["Kevin Ponce"]
  s.email       = ["kevinponce88@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of KpJwtClient."
  s.description = "TODO: Description of KpJwtClient."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
