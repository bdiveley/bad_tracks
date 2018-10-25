Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :songs, only: [:index]
  resources :artists, only: [:index, :new, :create, :show] do
    resources :songs, only: [:new, :create, :show]
  end
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end

  resources :carts, only: [:create]
end
