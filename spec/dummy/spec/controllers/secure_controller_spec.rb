# frozen_string_literal: true

require 'rails_helper'
require 'support/generic_support'
require 'kp_jwt_client/tokens/auth'
require 'support/kp_jwt_client/tokens/auth_support'

describe SecureController, type: :controller do
  include GenericSupport
  include KpJwtClient::Tokens::AuthSupport

  describe 'get #index' do
    let!(:user) { User.create(email: 'ex@ample.com', password: 'password123') }
    let!(:auth_token) { build_auth(1, 'user') }

    describe 'valid jwt token' do
      before(:each) do
        headers = { 'Authorization': "JWT #{auth_token}" }
        request.headers.merge! headers
        get :index
      end

      it { expect(response).to be_success }
      it { expect(response.status).to eq(200) }
      it { expect(body_as_json(response)[:user]).to_not be_nil }
      it { expect(body_as_json(response)[:errors]).to be_nil }
    end
  end
end
