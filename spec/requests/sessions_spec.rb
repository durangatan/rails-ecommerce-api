require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  let!(:customer) { create(:customer) }
  describe 'POST /login' do

    it 'returns an auth token' do
      post '/login', params: { email: customer.email, password: 'secret' }
      expect(json['token']).not_to be_empty
    end
  end
end
