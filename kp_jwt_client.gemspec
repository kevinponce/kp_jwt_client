# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'kp_jwt_client/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'kp_jwt_client'
  s.version     = KpJwtClient::VERSION
  s.authors     = ['Kevin Ponce']
  s.email       = ['kevinponce88@gmail.com']
  s.homepage    = 'https://github.com/kevinponce/kp_jwt_client'
  s.summary     = 'This gem is an easy to use jwt auth library validation without creation.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.2'
  s.add_dependency 'jwt', '~> 1.5'
  s.add_dependency 'bcrypt', '~> 3.1'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'guard-rubocop'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'terminal-notifier-guard'
  s.add_development_dependency 'timecop'
end
