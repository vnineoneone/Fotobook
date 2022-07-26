class PhotosController < ApplicationController
    skip_before_action :authenticate_user!, only: :photo_guest
    # before_action :check_user, only: [:edit, :update]

    def index
        @photos = current_user.photos
    end

    def photo_guest
        @photos = Photo.all.is_public
        # @photos.sort!{ |a, b| b <=> a }
        render "photos/feed"
    end

    def photo_discover
        @photos = Photo.all.is_public
        # @photos.sort!{ |a, b| b <=> a }
        @type = 'discover'
        render "photos/feed"
    end

    def photo_feed
        @user_followings= current_user.followings
        @photos = []
        @user_followings.each do |user|
            @photos +=  user.photos.is_public
        end
        @photos.sort!{ |a, b| b <=> a }
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
