# frozen_string_literal: true

# Use this hook to configure KpJwtClient
KpJwtClient.setup do |config|
  # Signature key
  # this token must match parent where the tokens are created
  # by default it is set to -> { Rails.application.secrets.secret_key_base }
  # config.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }
end
