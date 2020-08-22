Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  get "transactions/:id", to: "transactions#index"
  post "transactions/:id", to: "transactions#create"
end
