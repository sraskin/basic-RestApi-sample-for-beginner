Rails.application.routes.draw do

  namespace :api, path: '/' do
    namespace :v1, path: '/', constraints: { subdomain: 'api' } do
      resources :articles
    end
  end

end
