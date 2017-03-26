require 'rails_helper'

RSpec.describe 'Cart Additions API', type: :request do
  let!(:admin) { create(:admin) }
  before { login_and_get_token }
  let!(:cart_additions) { create_list(:cart_addition, 10) }
  let(:cart_addition_id) { CartAddition.first.id }
  let!(:customer) { create(:customer) }
  let!(:another_customer) { create(:customer) }
  let!(:item){ create(:item) }
  describe 'GET /cart_additions' do
    before { get_with_token '/cart_additions' }
    it 'returns an array of cart_additions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /cart_additions/:id' do
    before { get_with_token "/cart_additions/#{cart_addition_id}" }

    context 'when the cart_addition exists' do
      it 'returns the cart_addition' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(cart_addition_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:cart_addition_id) { 1000 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find CartAddition/)
      end
    end
  end

  describe 'POST /cart_additions' do
    let(:valid_attributes) { { customer_id: customer.id, item_id: item.id } }

    context 'when the request is valid' do
      before { post_with_token '/cart_additions', valid_attributes }
      it 'creates a item' do
        expect(json['customer_id']).to eq(customer.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post_with_token '/cart_additions', { customer_id: -3 } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /cart_additions/:id' do
    let(:valid_attributes) { { customer_id: another_customer.id } }
    context 'when the record exists' do
      before { put_with_token "/cart_additions/#{cart_addition_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status 204
      end
    end
  end

  describe 'DELETE /cart_additions/:id' do
    before { delete_with_token "/cart_additions/#{cart_addition_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status 204
    end
  end
end
