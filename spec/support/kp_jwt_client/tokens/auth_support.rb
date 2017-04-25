module KpJwtClient
  module Tokens
    module AuthSupport
      TYPE = 'regular'.freeze

      attr_accessor :entity_id, :entity_name

      def build_auth(entity_id, entity_name)
        self.entity_id = entity_id
        self.entity_name = entity_name

        JsonWebToken.encode(body)
      end

      private

      def body
        @body ||= {
          entity_id: entity_id,
          entity: entity_name,
          token_type: TYPE
        }.reject { |k, v| v.nil? }
      end
    end
  end
end
