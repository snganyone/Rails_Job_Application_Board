class AgenciesController < ApplicationController
	def index
		@agency = Agency.all
	end
end
