class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(:name, params[:user][:name])
		session[:name] = session[:user][:name]
		if session[:name].nil? || session[:name].empty?
			redirect_to '/signin'
		else
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		end
	end
end
