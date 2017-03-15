require 'rails_helper'

RSpec.describe 'Braintree API', type: :request do

  describe "GET /client_token" do
    before { get "/client_token"}

    it "returns a braintree token" do
      expect(json["token"]).not_to be_empty
    end
  end

  describe "POST /checkout" do
    let(:valid_attributes){{payment_method_nonce:"fake-valid-nonce"}}
  end
end
