class UsersController < ApplicationController    
    # def new
    #     @user = User.new
    #     render "pages/signup_view"
    # end

    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to new_user_session_path
        else
            render new_user_registration_path, status: :unprocessable_entity
        end
    end
    
    def edit
        @user = User.find_by(id: current_user.id)
    end

    def update
        @user = User.find(current_user.id)

        if @user.update(user_params)
            redirect_to edit_user_path(@user)
        else
            flash[:alert] = @user.errors.full_messages
            render :edit, status: :unprocessable_entity
        end
    end

    def followers_profile 
        @user_followers = current_user.followers
        
    end

    def followings_profile 
        @user_followings = current_user.followings
    end

    def follow
        user = User.find_by(id: current_user)
        user.followings << User.where("id = ?", params[:id])
    end

    def unfollow
        user = User.find_by(id: current_user)
        user.followings.destroy(User.where("id = ?", params[:id]))
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :picture)
        end
end
