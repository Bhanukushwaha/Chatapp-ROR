Rails.application.routes.draw do
  resources :students
  root "students#index"
  get 'user_modal' => "sessions#user_modal"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "add_friend" => "students#add_friend"
  get "delete_request", to: "students#delete_request"
  get 'my_request', to: "students#my_request"
  get 'accepted_request', to: "students#accepted_request"
  get 'friend_list', to: 'friends#friend_list'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :rooms do
   resources :messages
  end
  resources :users
  # root 'rooms#index'
end
