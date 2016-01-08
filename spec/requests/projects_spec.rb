require 'spec_helper'

describe 'Projects', type: :request do
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
    let(:params) {{ name: 'rails', category_id: category.id, url: 'https://github.com/rails/rails',  }}

    it 'should create project' do
      expect {
        post api_v1_projects_path, params, headers
      }.to change(Project, :count).by(1)

      expect(response).to be_success
    end

    it 'should respond with error if project is not created' do
      expect {
        post api_v1_projects_path, {}, headers
      }.not_to change(Project, :count)

      expect(response).to be_unprocessable
    end
  end

  describe "POST 'update'" do
    let!(:project) { FactoryGirl.create(:project) }
    let!(:user) { FactoryGirl.create(:user, :admin) }
    let(:headers) {{ 'Authorization': user.token }}

    it 'should update project' do
      put api_v1_project_path(project), { name: 'rake' }, headers

      project.reload

      expect(project.name).to eq('rake')
      expect(response).to be_success
    end

    it 'should respond with error if project is not updated' do
      put api_v1_project_path(project), { name: '' }, headers

      expect(project).to eq(project.reload)
      expect(response).to be_unprocessable
    end
  end

  describe "POST 'toggle_favorite'" do
    let!(:project) { FactoryGirl.create(:project) }
    let!(:user) { FactoryGirl.create(:user) }
    let(:headers) {{ 'Authorization': user.token }}

    it 'should add project to users favorites' do
      post toggle_favorite_api_v1_project_path(project), {}, headers

      project.reload

      expect(project.users).to include(user)
      expect(response).to be_success
    end

    it 'should remove project from users favorites' do
      project.users << user

      post toggle_favorite_api_v1_project_path(project), {}, headers

      project.reload

      expect(project.users).to_not include(user)
      expect(response).to be_success
    end
  end
end
