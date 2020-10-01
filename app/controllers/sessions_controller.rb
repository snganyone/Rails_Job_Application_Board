class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			flash[:alert] = "Signed in successfully!"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_to signin_path
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end
	
	#Google Omniauth!
	def omniauth
		user = User.from_omniauth(auth)
		if user.valid?
			session[:user_id] = user.id
			redirect_to root_path
		else
			redirect_to signin_path
		end
	end

	protected

	def auth
		request.env['omniauth.auth']
	end
end
