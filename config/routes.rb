Rails.application.routes.draw do
  get 'mentors/index'
  get 'profiles/index'
  get 'profiles/new'
  get 'profiles/edit'
  devise_for :users
  
  root to: "rooms#index"
  resources :messages
  resources :rooms do
    resources :messages
  end
  resources :profiles do
  collection do #今回はcollectionを使用（idは不要）
   get 'list_up'
   get 'search'
  end
end
  resources :mentors do
    collection do #今回はcollectionを使用（idは不要）
     get 'mentor_approval'
     get 'mentor_user'
     get 'rooms_list_up'
     get 'profiles_list_up'
     get 'users_search'
    end
 end
end
