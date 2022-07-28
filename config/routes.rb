Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "photos#photo_guest"
  get "/users/feed/photos" => "photos#photo_feed", :as => :user_root


  devise_for :users

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new"
  end



  # pages for all users
  # get '/login', to: 'pages#login_view'
  # post '/login', to: 'pages#login'
  # get '/signup', to: 'users#new'

  # Guest users 
  get '/albums', to: 'albums#album_guest'
  get '/photos', to: 'photos#photo_guest'
  # Normal user


  resources :users, shallow: true do
    resources :albums, :photos

    # Profile user
    member do
      get :followings, to: 'users#followings_profile' 
      get :followers, to: 'users#followers_profile' 
    end

    # Follow  and unfollow user
    member do 
      post :follow, :unfollow
    end

  end


  scope :feed do
    # get '/', to: 'photos#photo_feed', as: 'feed'
    get 'photos', to: 'photos#photo_feed', as: 'feed_photo'
    get 'albums', to: 'albums#album_feed', as: 'feed-album'
  end

  scope :discover do
    # get '/' => 'photos#photo_discover', as: 'discover'
    get 'photos', to: 'photos#photo_discover', as: 'discover_photo'
    get 'albums', to: 'albums#album_discover', as: 'discover_album'
  end

  # match '/:type/:id/like', via: [:post, :delete]



  # # Like photo
  resources :photos do
    member do
      post :like
      post :unlike
    end
  end

  # Like album
  resources :albums do
    member do
      post :like
      post :unlike
    end
  end

  # Admin user
  get "/admin", to: "admin/users#index", as: :admin_root
  namespace :admin do
    resources :photos, :albums, :users
  end
  
end
