class JobsController < ApplicationController
	
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end
	
	def create
		@job = Job.new(job_params)
		
		if @job.save
			redirect_to job_path(@job)
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to job_path(@job)
	end

	private

	def job_params
		params.require(:job).permit(:title, :employer, :location, :description, :release_date, :job_type, :user_id, :agency_id)
	end

	def require_login
		redirect_to signin_path unless session.include? :user_id
	end
end
