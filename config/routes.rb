Rails.application.routes.draw do
  root "home#index"
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "ticket/:id", to: "tickets#new"
  post "/ticket", to: "tickets#create"
  get "/view", to: "home#new"
  resources :users, except: [:new]
end
