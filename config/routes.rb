Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "feeds#index"

  # pages 
  get '/login', to: 'pages#login'
  get '/signup', to: 'pages#signup'

  resource :users do
    resources :albums
    resources :photos
  end

  post 'user/follow', to: 'users#follow'
  delete '/unfollow', to: 'users#unfollow'

  post '/like_posts/album', to: 'users#like_album'
  delete '/like_posts/photo', to: 'users#like_photo'
  
  scope '/users/:id/profile' do
    get '/photos', to: 'pages#profile_photo'
    get '/albums', to: 'pages#profile_album'
    get '/followings', to: 'pages#profile_following'
    get '/followers', to: 'pages#profile_follower'
  end

  namespace :admin do
    resources :photos, :albums, :users
  end
  

end
