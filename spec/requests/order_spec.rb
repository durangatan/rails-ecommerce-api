require 'rails_helper'

RSpec.describe 'Orders API', type: :request do

  let!(:orders){ create_list(:order, 10)}
  let(:order_id){Order.first.id}
  let!(:customer){create(:customer)}
  let!(:another_customer){create(:customer)}

  describe "GET /orders" do
    before { get "/orders"}

    it "returns an array of Orders" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /orders/:id" do
    before { get "/orders/#{order_id}"}

    context "when the order exists" do
      it "returns the order" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(order_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:order_id){1000}
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe "POST /Orders" do
    let(:valid_attributes){{customer_id:customer.id }}

    context 'when the request is valid' do
      before { post "/orders", params: valid_attributes }
      it 'creates a item' do
        expect(json['customer_id']).to eq(customer.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/orders", params: {customer_id: -3}}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /Orders/:id' do
    let(:valid_attributes){{ customer_id: another_customer.id}}
    context 'when the record exists' do
      before {put "/orders/#{order_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status 204
      end
    end
  end

  describe 'DELETE /orders/:id' do
    before { delete "/orders/#{order_id}"}
    it "returns status code 204" do
      expect(response).to have_http_status 204
    end
  end
end
