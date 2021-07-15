class Admin::CommentsController < ApplicationController
	load_and_authorize_resource
	def index
		@comment = Comment.paginate(page: params[:page], per_page: 5)
	end	

end
