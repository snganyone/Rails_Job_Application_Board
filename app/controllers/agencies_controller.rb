class AgenciesController < ApplicationController
	def index
		@agency = Agency.all
	end

	def new
		@agency = Agency.new
	end
end
