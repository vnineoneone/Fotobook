class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_locale
    before_action :configure_permitted_parameters, if: :devise_controller?

    etag { Rails.application.importmap.digest(resolver: helpers) if request.format&.html? }
    def set_locale
        if params[:locale] == 'vi'
            I18n.locale = params[:locale] 
        end
    end

    def configure_permitted_parameters
        added_attrs = [:first_name,:last_name, :email, :password, :password_confirmation, :current_password, :picture]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    private
    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end
    
    def after_sign_in_path_for(resource_or_scope)
        feed_photo_path
    end
end
