class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    
    def home
    end

    def redirect_if_not_logged_in
        if !current_user
            redirect_to '/'
        end
    end
    
    def current_user
        @user ||=  User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end
end
