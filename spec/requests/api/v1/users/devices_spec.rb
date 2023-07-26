require 'rails_helper'

RSpec.describe 'Api::V1::Users::Devices', type: :request do
  describe 'POST /create' do
    subject(:request) { post "/api/v1/users/#{user.id}/devices", params: {device_id: "abcdf", device_token: "fdcba"} }

    let(:user) { create(:user) }

    it 'returns' do
      request
      expect(response).to have_http_status :ok
    end
  end

  describe 'When params is missing' do
    subject(:request) { post "/api/v1/users/#{user.id}/devices" }

    let(:user) { create(:user) }

    it 'returns' do
      request
      expect(response).to have_http_status :unprocessable_entity
    end
  end

end
