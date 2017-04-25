require 'kp_jwt_client/engine'

module KpJwtClient
  mattr_accessor :token_secret_signature_key
  self.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }

  # run rails generate kp_jwt_client:install
  class << self
    def setup
      yield self
    end
  end
end
