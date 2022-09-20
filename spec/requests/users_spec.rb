require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get "/users"
    end

    it 'Users index is successful' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders correct template' do
      expect(response).to render_template(:index)
    end
  end
end
