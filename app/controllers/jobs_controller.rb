class JobsController < ApplicationController
	before_action :redirect_if_not_logged_in
	
	def index
		@jobs = Job.all
	end

	def show
		current_user.jobs
	end


end
