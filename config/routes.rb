Rails.application.routes.draw do
  devise_for :users
  
  root to: "rooms#index"
  resources :messages
  resources :rooms do
    resources :messages
  end
end
