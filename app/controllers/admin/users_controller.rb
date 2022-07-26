class Admin::UsersController < ApplicationController
    layout 'admin'
    def index
        @users = User.all
    end

    def edit
        @user = User.find_by("id = ?", params[:id])
    end
    
    def update
        @user = User.find_by("id = ?", params[:id])
        
        if @user.update(user_params)
            redirect_to  admin_users_path(current_user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find_by("id = ?", params[:id])
        if @user.destroy
            redirect_to admin_root_path(current_user)
        else
            redirect_to admin_users_path(current_user), status: :see_other
        end
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :active, :current_password)
    end
end
