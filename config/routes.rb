Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :webhook do
    namespace :github do
      resources :issue_events, only: [:create]
    end
  end
end
