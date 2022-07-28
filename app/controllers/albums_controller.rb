class AlbumsController < ApplicationController
    skip_before_action :authenticate_user!, only: :album_guest

    def index
        @user = params[:user_id] != current_user ? User.find_by(id: params[:user_id]) : current_user
        @albums = @user.albums
        @is_user = (params[:user_id].to_i == current_user.id)
    end

    def album_guest
        @albums = Album.all
        render "albums/feed"
    end

    def album_discover
        @albums = Album.all
        @type = 'discover'
        render "albums/feed"
    end

    def album_feed
        @user_followings= current_user.followings
        @albums = []
        @user_followings.each do |user|
            @albums +=  user.albums.is_public
        end
        @albums += current_user.albums
        @albums.sort!{ |a, b| b <=> a }
        @type = 'feed'
        render "albums/feed"
    end

    def new
        @user = User.find_by(id: current_user.id)
        @album = @user.albums.new()  
    end

    def create
        @user = User.find_by(id: current_user.id)
        @album = @user.albums.new(album_params)
        
        if @album.save
            redirect_to user_albums_path(current_user)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @album = Album.find_by("id = ?", params[:id])
    end

    def update
        @album = Album.find_by("id = ?", params[:id])
        if @album.update(album_params)
            redirect_to  user_albums_path(current_user)
        else
            flash[:alert] = @album.errors.full_messages
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album = Album.find_by("id = ?", params[:id])
        if @album.destroy
            redirect_to user_albums_path(current_user)
        else
            redirect_to user_albums_path(current_user), status: :see_other
        end
    end

    def like
        album = Album.find_by("id =?", params[:id])
        current_user.like_albums << album
    end

    def unlike
        album = Album.find_by("id =?", params[:id])
        current_user.like_albums.destroy(album) 
    end

    private
    def album_params
        params.require(:album).permit(:title, :description, :is_public, pictures: [])
    end

end
