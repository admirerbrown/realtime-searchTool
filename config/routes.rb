Rails.application.routes.draw do
  resources :articles do
    collection do
      post :search
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/analytics/call_analytics_service', to: 'analytics#call_analytics_service'

  # Defines the root path route ("/")
  root 'articles#index'
end
