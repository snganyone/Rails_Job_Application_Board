class JobsController < ApplicationController
	#Requires users to login
	before_action :redirect_if_not_logged_in

	def index
		@jobs = Job.all
	end

	def new
		if current_user.admin == true
			@job = Job.new
		else
			flash[:alert] = "Your are not admin, sorry"
			redirect_to jobs_path
		end
	end
	
	def create
		@job = Job.new(job_params)
		if @job.valid?
			flash[:alert] = "Job Successfully Created!"
			@job.save
			redirect_to job_path(@job)
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		if current_user.admin == true
			@job = Job.find(params[:id])
		else
			redirect_to jobs_path
		end
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to job_path(@job)
	end

	#Delete Action
	def destroy
		if current_user.admin == true
			@job = Job.find_by_id(params[:id])
			@job.destroy
			redirect_to jobs_path
		else
			redirect_to jobs_path
		end
	end

	private
	# Job Form Parameters
	def job_params
		params.require(:job).permit(:title, :employer, :location, :description, :release_date, :job_type, :user_id, :agency_id)
	end

end
