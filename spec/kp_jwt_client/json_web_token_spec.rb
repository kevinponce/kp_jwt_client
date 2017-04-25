# frozen_string_literal: true

require 'rails_helper'
require 'jwt'

# spec/lib/json_web_token_sepc.rb
RSpec.describe KpJwtClient::JsonWebToken do
  before(:each) { KpJwtClient.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base } }

  describe 'encode' do
    it { expect(KpJwtClient::JsonWebToken.encode(user_id: 1)).to_not be_nil }
    it { expect(KpJwtClient::JsonWebToken.encode(user_id: 1).split('.').length).to eq(3) }
  end

  describe 'decode' do
    let(:token) { KpJwtClient::JsonWebToken.encode(user_id: 1) }

    it { expect(KpJwtClient::JsonWebToken.decode(token)).to_not be_nil }
    it { expect(KpJwtClient::JsonWebToken.decode(token)[:user_id]).to eq(1) }
    it { expect(KpJwtClient::JsonWebToken.decode(token)[:user_id]).to_not eq(2) }

    it 'tamper with token body before decode' do
      token_params = token.to_s.split('.')
      token_params[1].reverse!

      expect(KpJwtClient::JsonWebToken.decode(token_params.join('.'))).to be_nil
    end
  end
end
