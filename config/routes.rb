Rails.application.routes.draw do
  get 'profiles/index'
  get 'profiles/new'
  get 'profiles/edit'
  devise_for :users
  
  root to: "rooms#index"
  resources :messages
  resources :rooms do
    resources :messages
  end
  resources :profiles
end
