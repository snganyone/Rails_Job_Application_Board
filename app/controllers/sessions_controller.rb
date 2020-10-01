class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		session[:name] = params[:user][:name]
		if session[:name].nil? || session[:name].empty?
			redirect_to '/signin'
		else
			flash[:alert] = "Signed in successfully!"
			session[:user_id] = @user.id
			redirect_to root_path
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end
end
