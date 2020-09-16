Rails.application.routes.draw do
  devise_for :users
  
  root to: "messages#index"
  resources :messages
  resources :rooms do
    resources :messages
  end
end
