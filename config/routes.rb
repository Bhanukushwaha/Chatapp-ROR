Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", :registrations => "users/registrations", :passwords => "users/passwords"}
  resources :students
  mount ActionCable.server => '/cable'

  root "home#index"
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
  # get '/home' => "home#index"
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
  resources :rooms do
   resources :messages
  end
  delete "/message/:id" => "messages#delete", as: :delete_message
  resources :users
end
