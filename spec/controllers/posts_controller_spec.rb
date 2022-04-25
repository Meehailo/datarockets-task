require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST #create' do
    login_user

    it 'returns a 200 status code' do
      params = { 'author': 'john', 'title': 'second', 'body': 'this is my post' }
      post :create, as: :json, params: params
      expect(response.status).to eq(201)
    end

    it 'returns a 422 status code' do
      params = { 'author': 'john', 'title': 'second', 'body': 'th' }
      post :create, as: :json, params: params
      expect(response.status).to eq(422)
    end

    it 'body has errors' do
      params = { 'author': 'john', 'title': 'second', 'body': 'th' }
      post :create, as: :json, params: params
      response_keys = JSON.parse(response.body)
      expect(response_keys).to eq( { 'body' => ['is too short (minimum is 10 characters)']})
    end
  end
end
