Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      match '*path' => 'application#not_found', :via => [:get, :post]
      match '*path' => 'application#cors_preflight', :via => :options
    end
  end

  get '(*page)' => 'pages#index'
end
