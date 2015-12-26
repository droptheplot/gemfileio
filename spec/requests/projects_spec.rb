require 'spec_helper'

describe 'Projects', :type => :request do
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

  describe "POST 'create'" do
    let!(:category) { FactoryGirl.create(:category) }
    let(:params) {{ name: 'rails', category_id: category.id }}

    it 'should create project' do
      expect {
        post api_v1_projects_path, params, headers
      }.to change(Project, :count).by(1)

      expect(response).to be_success
    end
  end

  describe "POST 'update'" do
    let!(:project) { FactoryGirl.create(:project) }
    let!(:user) { FactoryGirl.create(:user, :admin) }
    let(:params) {{ name: 'rake' }}
    let(:headers) {{ 'Authorization' => user.token }}

    it 'should update project' do
      put api_v1_project_path(project), params, headers

      project.reload

      expect(project.name).to eq('rake')
      expect(response).to be_success
    end
  end
end
