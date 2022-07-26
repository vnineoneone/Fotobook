class PagesController < ApplicationController
    layout 'page'

    def login
        redirect_to feed_photo_user_path(1)
    end

    def login_view
        render "login_view"
    end

    def signup
        render "signup_view"
    end
end
