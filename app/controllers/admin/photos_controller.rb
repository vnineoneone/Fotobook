class Admin::PhotosController < Admin::AdminController
    layout 'admin'
    def index
        @photos = Photo.all.page(params[:page]).per(5)
    end

    def edit
        @photo = Photo.find_by("id = ?", params[:id])
    end

    def update
        @photo = Photo.find_by("id = ?", params[:id])
        # @photo.picture.attach(params[:picture])
        
        if @photo.update(photo_params)
            redirect_to  admin_photos_path()
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @photo = Photo.find_by("id = ?", params[:id])
        if @photo.destroy
            redirect_to admin_photos_path()
        else
            redirect_to admin_photos_path(), status: :see_other
        end
    end

    private
    def photo_params
        params.require(:photo).permit(:title, :description, :is_public, :picture, :remove_avatar)
    end
end
