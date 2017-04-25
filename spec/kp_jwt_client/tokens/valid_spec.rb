# frozen_string_literal: true

require 'kp_jwt_client/tokens/auth'
require 'spec_helper_integration'
require 'support/kp_jwt_client/tokens/auth_support'

describe KpJwtClient::Tokens::Valid do
  include KpJwtClient::Tokens::AuthSupport

  let!(:auth_token) { build_auth(1, 'user') }

  describe 'auth token' do
    describe 'with exp' do
      it 'not expired' do
        allow(KpJwtClient::JsonWebToken).to receive(:decode).with(auth_token).and_return(id: 1, token_type: KpJwtClient::Tokens::Auth::TYPE, exp: 1.day.from_now.utc.to_i)

        expect(KpJwtClient::Tokens::Valid.new(auth_token).auth?).to be_truthy
      end

      it 'is expired' do
        allow(KpJwtClient::JsonWebToken).to receive(:decode).with(auth_token).and_return(id: 1, token_type: KpJwtClient::Tokens::Auth::TYPE, exp: 1.day.ago.utc.to_i)

        expect(KpJwtClient::Tokens::Valid.new(auth_token).auth?).to be_falsey
      end
    end

    describe 'no exp' do
      it 'valid' do
        allow(KpJwtClient::JsonWebToken).to receive(:decode).with(auth_token).and_return(id: 1, token_type: KpJwtClient::Tokens::Auth::TYPE)

        expect(KpJwtClient::Tokens::Valid.new(auth_token).auth?).to be_truthy
      end
    end
  end
end
