Rails.application.routes.draw do
  get 'static_pages/home'

  resources :parcels
  root "static_pages#home"
  get "/search", to: "parcels#index"
  post "/search", to: "parcels#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
