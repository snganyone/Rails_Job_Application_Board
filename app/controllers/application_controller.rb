class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :logged_in_user, :redirect_if_not_logged_in

    def home
        
    end
    
    def current_user
        @user ||=  User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def logged_in_user
        #byebug
        if params[:id].to_i == session[:user_id]
            @user ||=  User.find_by_id(session[:user_id]) if session[:user_id]
        end
    end

    def admin_user
        redirect_to jobs_path unless current_user.admin
    end

    def redirect_if_not_logged_in
        redirect_to '/' unless current_user
    end

end
