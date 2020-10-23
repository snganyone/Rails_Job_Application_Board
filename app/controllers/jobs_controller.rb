class JobsController < ApplicationController
	#Requires users to login
	before_action :redirect_if_not_logged_in, :admin_user, :set_job, only: [:show, :edit, :update, :destroy]
	skip_before_action :admin_user, only: [:index]

	def index
		if params[:query]
			@jobs = Job.search(params[:query])
		else
			@agency = Agency.all
			@jobs = Job.all.date_order#.order(release_date: :desc)
			flash.now[:notice] = "We have exactly #{@jobs.size} jobs right now"
		end
	end

	def new
		@job = Job.new
	end
	
	def create
		@job = Job.new(job_params)
		if @job.valid?
			@job.save
			flash[:success] = "Job Successfully Created!" 
			redirect_to job_path(@job)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		@job.update(job_params)
		redirect_to job_path(@job)
	end

	#Delete Action
	def destroy
		if current_user.admin == true
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

	def set_job
		@job = Job.find(params[:id])
	end

end
