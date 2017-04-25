module KpJwtClient
  module Tokens
    class Valid
      attr_accessor :http_token

      def initialize(http_token)
        self.http_token = http_token
      end

      def auth?
        valid? && tokens[:token_type] == Tokens::Auth::TYPE
      end

      private

      def tokens
        @tokens ||= JsonWebToken.decode(http_token)
      end

      def valid_token?
        tokens.present? && tokens[:entity_id].to_i.present?
      end

      def exp?
        return true unless tokens[:exp]

        tokens[:exp] > Time.now.utc.to_i
      end

      def valid?
        valid_token? && exp?
      end
    end
  end
end
