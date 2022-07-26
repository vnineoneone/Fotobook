class Admin::AlbumsController < ApplicationController
    layout 'admin'
    def index
        @albums = Album.all
    end

    def edit
        @album = Album.find_by("id = ?", params[:id])
    end

    def update
        @album = Album.find_by("id = ?", params[:id])
        if @album.update(album_params)
            redirect_to  admin_albums_path()
        else
            flash[:alert] = @album.errors.full_messages
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album = Album.find_by("id = ?", params[:id])
        if @album.destroy
            redirect_to admin_albums_path()
        else
            redirect_to admin_albums_path(), status: :see_other
        end
    end

    private
    def album_params
        params.require(:album).permit(:title, :description, :is_public, pictures: [])
    end
end
