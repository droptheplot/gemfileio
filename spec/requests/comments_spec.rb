require 'spec_helper'

describe 'Comments', type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  let(:headers) {{ 'Authorization' => user.token }}

  describe "GET 'index'" do
    let!(:project) { FactoryGirl.create(:project, :with_comments) }

    it 'should return array of comments for project' do
      get api_v1_comments_path, { project_id: project.id }, headers

      expect(response).to be_success
      expect(json).to_not be_nil
    end
  end
end
