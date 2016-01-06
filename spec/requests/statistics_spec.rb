require 'spec_helper'

describe 'Statistics', type: :request do
  describe "GET 'index'" do
    it 'should return array of statistics' do
      FactoryGirl.create_list(:statistic, 5)

      get api_v1_statistics_path

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end
end
