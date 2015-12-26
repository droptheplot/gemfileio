require 'spec_helper'

describe 'Categories', type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  let(:headers) {{ 'Authorization': user.token }}

  describe "GET 'index'" do
    let!(:categories) { FactoryGirl.create_list(:category, 5) }

    it 'should return array of categories' do
      get api_v1_categories_path, {}, headers

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end

  describe "GET 'show'" do
    let!(:category) { FactoryGirl.create(:category) }

    it 'should return category' do
      get api_v1_category_path(category), {}, headers

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end
end
