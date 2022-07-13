Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#photo_view"

  # pages for all users
  get '/login', to: 'pages#login'
  get '/signup', to: 'pages#signup'

  # Guest users 
  get '/feeds/albums', to: 'pages#album_view'
  get '/feeds/photos', to: 'pages#photo_view'

  # Normal user

  resources :users,only: [:show, :update, :edit] do
    resources :albums, :photos

    # Profile user
    member do
      scope :profile do
          get :photos
          get :albums
          get :followings
          get :follows
      end
    end

    # Follow  and unfollow user
    member do 
      post :follow, :unfollow
    end

  end

  # Like photo
  resources :photos do
    member do
      post :like
      delete :unlike
    end
  end

  # Like album
  resources :albums do
    member do
      post :like
      delete :unlike
    end
  end

  # Admin user
  namespace :admin do
    resources :photos, :albums, :users
  end
  
end
