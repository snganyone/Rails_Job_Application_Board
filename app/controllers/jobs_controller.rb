class JobsController < ApplicationController
	
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end
	
	def create
	end

	def show
		current_user.jobs
	end

	private

	def require_login
		redirect_to signin_path unless session.include? :user_id
	end
end
