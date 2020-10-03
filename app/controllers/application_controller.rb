class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :logged_in_user, :redirect_if_not_logged_in, :admin_user

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
        if current_user.admin == false
            flash[:alert] = "Your are not an admin, only system administrators can perform that action."
            redirect_to root_path
        end
    end

    def redirect_if_not_logged_in
        redirect_to '/' unless current_user
    end

end
