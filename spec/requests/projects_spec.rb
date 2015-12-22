require 'spec_helper'

describe 'Projects', :type => :request do
  let!(:user) { FactoryGirl.create(:user) }
  let(:headers) {{ 'Authorization' => user.token }}

  describe "GET 'index'" do
    let!(:projects) { FactoryGirl.create_list(:project, 5) }

    it 'should return array of projects' do
      get api_v1_projects_path, {}, headers

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end

  describe "GET 'show'" do
    let!(:project) { FactoryGirl.create(:project) }

    it 'should return project' do
      get api_v1_project_path(project), {}, headers

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end
end
