require 'spec_helper'

describe 'Comments', type: :request do
  describe "GET 'index'" do
    let!(:project) { FactoryGirl.create(:project, :with_comments) }

    it 'should return array of comments for project' do
      get api_v1_comments_path, { project_id: project.id }, headers

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end

  describe "POST 'create'" do
    let!(:project) { FactoryGirl.create(:project) }
    let!(:user) { FactoryGirl.create(:user) }
    let(:headers) {{ 'Authorization': user.token }}
    let(:params) {{ body: 'comment', project_id: project.id }}

    it 'should create comment for project' do

      expect {
        post api_v1_comments_path, params, headers
      }.to change(Comment, :count).by(1)

      expect(response).to be_success
    end

    it 'should respond with error if comment is not created' do
      expect {
        post api_v1_comments_path, {}, headers
      }.not_to change(Comment, :count)

      expect(response).to be_unprocessable
    end
  end
end
