class UsersController < ApplicationController
    before_action :logged_in?
    skip_before_action :logged_in?, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        require_login
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :bio)
    end

    def require_login
        redirect_to signin_path unless session.include? :user_id
    end
end
