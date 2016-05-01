require 'spec_helper'

describe 'Application', type: :request do
  describe 'When page is not found' do
    it 'returns 404 status and message' do
      get '/api/v1/not_found'

      expect(json).to eq({ 'error' => 'Not found' })
      expect(response.status).to eq(404)
    end
  end

  describe 'CORS preflight' do
    it 'returns 200 status for OPTIONS requests' do
      options '/api/v1/preflight'

      expect(response.status).to eq(200)
    end
  end
end
