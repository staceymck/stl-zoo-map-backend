Rails.application.routes.draw do
  resources :reviews
  resources :attractions
  resources :exhibits
  resources :zones
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
