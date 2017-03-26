require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let!(:admin) { create(:admin) }
  before { login_and_get_token }
  let!(:categories) { create_list(:category, 10) }
  let(:category_id){Category.first.id}

  describe 'GET /categories' do
    before { get '/categories'}

    it 'returns an array of Categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /categories/:id' do
    before { get "/categories/#{category_id}"}

    context 'when the category exists' do
      it 'returns the category' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(category_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:category_id){1000}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'POST /categories' do
    let(:valid_attributes){ { name: 'Used Instruments' } }

    context 'when the request is valid' do
      before { post_with_token '/categories', valid_attributes }
      it 'creates a item' do
        expect(json['name']).to eq('Used Instruments')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post_with_token '/categories', {fail: 'jazz'} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match(/PG::NotNullViolation:/)
      end
    end
  end

  describe 'PUT /categories/:id' do
    let(:valid_attributes){{ name: 'King Super 20'}}
    context 'when the record exists' do
      before {put_with_token "/categories/#{category_id}", valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status 204
      end
    end
  end

  describe 'DELETE /categories/:id' do
    before { delete_with_token "/categories/#{category_id}"}
    it 'returns status code 204' do
      expect(response).to have_http_status 204
    end
  end
end
