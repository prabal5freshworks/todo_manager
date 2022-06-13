Rails.application.routes.draw do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/", to: "home#index"
  resources :todos

  resources :users

  get "/signin" => "sessions#new", as: :new_session

  post "/signin" => "sessions#create", as: :session

  delete "/signout" => "sessions#destroy", as: :destroy_session
  post "/users/login", to: "users#authenticate"
end
