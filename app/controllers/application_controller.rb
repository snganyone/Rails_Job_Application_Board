class ApplicationController < ActionController::Base
    def home
    end

    def current_user
	    @user ||=  User.find_by_id(session[:user_id])
    end

    def redirect_if_not_logged_in
        if !current_user
            redirect_to '/'
        end
    end
end
