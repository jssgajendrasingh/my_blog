class Admin::TagsController < ApplicationController

	def new 

	end

	def create 
		#binding.pry
		@tag= Tag.create(tag_names) 
		redirect_to root_path
	end	

	private

	def tag_names
		params.require(:tag).permit(:name)
	end	
end
