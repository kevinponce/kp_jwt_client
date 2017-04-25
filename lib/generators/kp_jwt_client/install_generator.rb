# frozen_string_literal: true

module KpJwtClient
  # install generator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)

    desc 'Creates a KpJwtClient initializer.'

    def copy_initializer
      template 'kp_jwt_client.rb', 'config/initializers/kp_jwt_client.rb'
    end
  end
end