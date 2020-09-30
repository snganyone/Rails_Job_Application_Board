class UsersController < ApplicationController
    before_action :logged_in?, :logged_in_user
    skip_before_action :logged_in?, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            flash[:alert] = "Successfully Signed Up!"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :bio)
    end
end
