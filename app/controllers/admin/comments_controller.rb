class Admin::CommentsController < ApplicationController
	load_and_authorize_resource
	def index
		@comment = Comment.all
	end	

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			flash[:notice] = "Comment is Updated is Successfully"
			@comment = Comment.all
			render :index		
		else 
			flash[:notice] = "Comment updation is failure"
			render :edit
		end
	end	

	private
	def comment_params
		params.require(:comment).permit(:fullname,:email,:message,:status)
	end	
	
end
