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
            flash[:notice] = "The account has been updated"
        else
            flash[:alert] = @user.errors.full_messages
            render :edit, status: :unprocessable_entity
        end
    end

    def followers_profile 
        @user = params[:id] != current_user ? User.find_by(id: params[:id]) : current_user
        @user_followers = @user.followers 
        @is_user = (params[:id].to_i == current_user.id)
        
    end

    def followings_profile 
        @user = params[:id] != current_user ? User.find_by(id: params[:id]) : current_user
        @user_followings = @user.followings
        @is_user = (params[:id].to_i == current_user.id)
    end

    def follow
        user = User.find_by(id: current_user)
        user.followings << User.where("id = ?", params[:id])
        redirect_back(fallback_location: root_path)
    end

    def unfollow
        user = User.find_by(id: current_user)
        user.followings.destroy(User.where("id = ?", params[:id]))
        respond_to do |format|
            format.js {render inline: "location.reload();" }
        end
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :picture)
        end
end
