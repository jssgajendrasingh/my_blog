class Admin::CommentsController < ApplicationController
	def index
		@comment = Comment.all
	end	

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		byebug
		if @comment.update(comment_params)
			flash[:notice] = "Comment is Updated is Successfully"
		else 
			flash[:notice] = "Comment updation is failure"
		end
		redirect_to admin_comments_path		
	end	

	private
	def comment_params
		params.require(:comment).permit(:fullname,:email,:message,:status)
	end	
	
end
