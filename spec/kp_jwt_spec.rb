# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KpJwtClient do
  it 'has a version number' do
    expect(KpJwtClient::VERSION).not_to be nil
  end
end
