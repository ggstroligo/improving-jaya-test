Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :webhook do
    namespace :github do
      resources :issue_events, only: [:create]
    end
  end

  namespace :api do
    scope "/issue/:issue_id", module: :issue, as: :issue_id do
      resources :events, only: :index
    end
  end
end
