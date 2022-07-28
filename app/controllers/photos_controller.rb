class PhotosController < ApplicationController
    skip_before_action :authenticate_user!, only: :photo_guest
    # before_action :check_user, only: [:edit, :update]

    def index
        @user = params[:user_id] != current_user ? User.find_by(id: params[:user_id]) : current_user
        @photos = @user.photos
        @is_user = (params[:user_id].to_i == current_user.id)
    end

    def photo_guest
        @photos = Photo.all.is_public
        render "photos/feed"
    end

    def photo_discover
        @photos = Photo.all.is_public
        @type = 'discover'
        render "photos/feed"
    end

    def photo_feed
        @user_followings= current_user.followings
        @photos = []
        @user_followings.each do |user|
            @photos +=  user.photos.is_public
        end
        @photos += current_user.photos
        @photos.sort!{ |a, b| a.created_at <=> b.created_at }
        @type = 'feed'
        render "photos/feed"
    end

    def new
        @photo = current_user.photos.new()
    end

    def create
        @photo = current_user.photos.new(photo_params)
        if @photo.save
            redirect_to user_photos_path(current_user)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @photo = Photo.find_by("id = ?", params[:id])
    end

    def update
        @photo = Photo.find_by("id = ?", params[:id])  
        if @photo.update(photo_params)
            redirect_to  user_photos_path(current_user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @photo = Photo.find_by("id = ?", params[:id])
        if @photo.destroy
            redirect_to user_photos_path(current_user)
        else 
            redirect_to user_photos_path(current_user), status: :see_other
        end
    end

    def like
        photo = Photo.find_by("id =?", params[:id])
        current_user.like_photos << photo
    end

    def unlike
        photo = Photo.find_by("id =?", params[:id])
        current_user.like_photos.destroy(photo) 
    end


    private
    def photo_params
        params.require(:photo).permit(:title, :description, :is_public, :picture, :remove_avatar)
    end

    # def check_user
    #     if current_user.albums.find_by(id: params[:id])
    #         return true
    #     return false
    # end
end
