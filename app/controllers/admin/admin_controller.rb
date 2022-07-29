class Admin::AdminController < ApplicationController
    before_action :check_admin

    private
    def check_admin()
        if current_user.is_admin
            true
        else
            redirect_to user_root_path
        end
    end

end