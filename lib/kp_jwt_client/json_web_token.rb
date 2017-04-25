# frozen_string_literal: true

module KpJwtClient
  require 'jwt'

  class JsonWebToken
    NATIVE = 'native'

    class << self
      def encode(payload)
        JWT.encode(payload, KpJwtClient.token_secret_signature_key.call)
      end

      def decode(token)
        HashWithIndifferentAccess.new(JWT.decode(token, KpJwtClient.token_secret_signature_key.call)[0])
      rescue
        nil
      end
    end
  end
end
