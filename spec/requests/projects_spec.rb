require 'spec_helper'

describe 'Projects', type: :request do
  describe "GET 'index'" do
    let!(:projects) { FactoryGirl.create_list(:project, 5) }

    it 'returns array of projects' do
      get api_v1_projects_path

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end

  describe "GET 'show'" do
    let!(:project) { FactoryGirl.create(:project) }

    it 'returns project' do
      get api_v1_project_path(project.id)

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end
end
