require 'rails_helper'

RSpec.describe 'Customers API', type: :request do

  let!(:customers){ create_list(:customer, 10)}
  let(:customer_id){Customer.first.id}

  describe "GET /customers" do
    before { get "/customers"}

    it "returns an array of customers" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /customers/:id" do
    before { get "/customers/#{customer_id}"}

    context "when the Customer exists" do
      it "returns the Customer" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(customer_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:customer_id){1000}
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end

  describe "POST /customers" do
    let(:valid_attributes){{name: "Used Instruments" }}

    context 'when the request is valid' do
      before { post "/customers", params: valid_attributes }
      it 'creates a customer' do
        expect(json["name"]).to eq("Used Instruments")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post "/customers", params: {fail: "jazz"}}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it "returns a validation failure message" do
        expect(response.body).to match(/PG::NotNullViolation:/)
      end
    end
  end

  describe 'PUT /customers/:id' do
    let(:valid_attributes){{ name: "King Super 20"}}
    context 'when the record exists' do
      before {put "/customers/#{customer_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status 204
      end
    end
  end

  describe 'DELETE /customers/:id' do
    before { delete "/customers/#{customer_id}"}
    it "returns status code 204" do
      expect(response).to have_http_status 204
    end
  end
end
