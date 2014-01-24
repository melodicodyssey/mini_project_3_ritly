class RitlyController < ApplicationController

	def index
	end

	def show
		@text = params[:search]
		@new_url = SecureRandom.urlsafe_base64(5) 
	end

end