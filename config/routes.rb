Rails.application.routes.draw do
  get 'users/new'

  get 'static_pages/home'

  resources :parcels
  root "static_pages#home"
  get "/search", to: "parcels#index"
  post "/search", to: "parcels#search"
  get "/login", to: "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
