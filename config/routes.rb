Rails.application.routes.draw do
  get 'mentors/index'
  get 'profiles/index'
  get 'profiles/new'
  get 'profiles/edit'
  devise_for :users
  
  root to: "rooms#home"
  resources :messages
  resources :rooms do
    resources :messages
    collection do #今回はcollectionを使用（idは不要）
      get 'home'
      get 'log_in'
      get 'list_up'
      get 'library'
     end
  end
  resources :profiles do
    collection do #今回はcollectionを使用（idは不要）
      get 'list_up'
      get 'search'
      get 'mentors_list_up'
    end
  end
  resources :mentors do
    collection do #今回はcollectionを使用（idは不要）
     get 'mentor_approval'
     get 'mentor_user'
     get 'new_rooms'
     get 'all_rooms'
     get 'all_profiles'
     get 'users_search'
    end
  end
  resources :library do
    collection do #今回はcollectionを使用（idは不要）
      get 'content_1'
      get 'content_2'
      get 'content_3'
      get 'content_4'
      get 'content_5'
      get 'content_6'
    end
  end
end
