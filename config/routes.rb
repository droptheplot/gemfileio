Rails.application.routes.draw do
  mount Robotron => '/robots.txt'

  namespace :api do
    mount Apipony::Engine => '/docs'

    namespace :v1, defaults: { format: 'json' } do
      resources :projects, only: [:index, :show, :create, :update] do
        member do
          post :toggle_favorite
          get :readme
        end
      end

      resources :categories, only: [:index, :show]
      resources :comments, only: [:index, :create]
      resources :statistics, only: :index

      namespace :users do
        post 'oauth/:provider' => :oauth
      end

      match '*path' => 'application#not_found', :via => [:get, :post]
      match '*path' => 'application#cors_preflight', :via => :options
    end
  end

  get '(*page)' => 'pages#index'

  root 'pages#index'
end
