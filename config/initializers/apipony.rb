Apipony::Documentation.define do
  config do |c|
    c.title = 'API Documentation'
    c.base_url = '/api/v1'
  end

  section 'Projects' do
    endpoint 'get', '/projects' do |e|
      request_with do
        param :active, example: true
        param :category_id, example: 1
        param :query, example: 'rails'
        param :favorited_by, example: 12
      end

      response_with 200, array: true do
        attribute :id, type: :string, example: 1
        attribute :name, type: :string, example: 'rails'
        attribute :owner, type: :string, example: 'rails'
        attribute :repo, type: :string, example: 'rails'
        attribute :stars_count, type: :string, example: 28913
        attribute :forks_count, type: :string, example: 11710
        attribute :downloads_count, type: :string, example: 58617256
        attribute :comments_count, type: :string, example: 5
        attribute :description, type: :string, example: 'Ruby on Rails'
        attribute :ref, type: :string, example: 'rails/rails'
        attribute :url, type: :string, example: 'https//github.com/rails/rails'
        attribute :active, type: :string, example: true
        attribute :category_id, type: :string, example: 1
      end
    end

    endpoint 'get', '/projects/:id' do |e|
      request_with do
        param :id, example: 1, required: true
      end

      response_with 200, array: true do
        attribute :id, type: :integer, example: 1
        attribute :name, type: :string, example: 'rails'
        attribute :owner, type: :string, example: 'rails'
        attribute :repo, type: :string, example: 'rails'
        attribute :stars_count, type: :integer, example: 28913
        attribute :forks_count, type: :integer, example: 11710
        attribute :downloads_count, type: :integer, example: 58617256
        attribute :comments_count, type: :integer, example: 5
        attribute :description, type: :string, example: 'Ruby on Rails'
        attribute :ref, type: :string, example: 'rails/rails'
        attribute :url, type: :string, example: 'https//github.com/rails/rails'
        attribute :readme, type: :string, example: '## Welcome to Rails...'
        attribute :active, type: :boolean, example: true
        attribute :category_id, type: :integer, example: 1
        attribute :favorited_by_current_user, type: :boolean, example: false
      end
    end
  end

  section 'Categories' do
    endpoint 'get', '/categories' do |e|
      response_with 200, array: true do
        attribute :id, type: :string, example: 1
        attribute :title, type: :string, example: 'Frameworks'
        attribute :projects_count, type: :integer, example: 5
      end
    end
  end
end
