class AgenciesController < ApplicationController
	def index
		@agency = Agency.all
	end

	def new
		@agency = Agency.new
	end

	def create
		@agency = Agency.new(agency_params)
		if @agency.valid?
			flash[:alert] = "Agency Successfully Created!"
			@agency.save
			redirect_to agency_jobs_path	
		end
	end

	private 

	def agency_params
		params.require(:agency).permit(:name, :bio, :agency_type)
	end
end
