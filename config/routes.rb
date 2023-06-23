Rails.application.routes.draw do
  devise_for :users
  resources :students
  root "students#index"
  get 'user_modal' => "friends#user_modal"
  get 'like' =>'posts#like', as: :like
  get 'unlike' =>'posts#unlike', as: :unlike
  resources :posts do
    resources :comments
    resources :likes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'comment' => 'posts#comment'
  get '/home' => "home#index"
  get "add_friend" => "students#add_friend"
  get "delete_request", to: "students#delete_request"
  get 'my_request', to: "students#my_request"
  get 'accepted_request', to: "students#accepted_request"
  get 'friend_list', to: 'friends#friend_list'
  get 'message', to: "friends#messages"
  get '/reset_password/id/edit', to: "users#reset_password"
  get '/reset_password/id/edit', to: "users#reset_password"
  get 'reset_password', to: "users#reset_password"
  post '/reset_password', to: 'users#password_update'
   get '/reset_password', to: "users#reset_password"
   patch '/users/:id', to: 'users#password_update'
  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # delete '/signout', to: 'sessions#destroy'
  resources :rooms do
   resources :messages
  end
  resources :users
  # root 'rooms#index'
end
