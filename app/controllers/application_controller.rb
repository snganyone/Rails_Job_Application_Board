class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :logged_in_user, :redirect_if_not_logged_in

    def home
    end
    
    def current_user
        @user ||=  User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def logged_in_user
        if params[:id] == session[:user_id]
            @correct_user ||= User.find_by(session[:id])
        else
            redirect_to '/'
        end
    end

    def redirect_if_not_logged_in
        redirect_to '/' unless current_user
    end

end
