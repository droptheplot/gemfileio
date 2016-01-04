require 'spec_helper'

describe 'Application', type: :request do
  describe 'Page not found' do
    it 'should return 404 status and message if route is not found' do
      get '/api/v1/not_found'

      expect(json).to eq({ 'error' => 'Not found' })
      expect(response.status).to eq(404)
    end
  end

  describe 'CORS preflight' do
    it 'should return 200 status for OPTIONS requests' do
      options '/api/v1/preflight'

      expect(response.status).to eq(200)
    end
  end
end