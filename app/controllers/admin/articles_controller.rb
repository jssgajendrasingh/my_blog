class Admin::ArticlesController < ApplicationController
	load_and_authorize_resource
	def index
		@user = current_user
		#inding.pry
		if @user.super_admin
			@article = Article.paginate(page: params[:page], per_page: 5)
		else
		  @article = Article.where(id: @user.id).paginate(per_page: 1, page: params[:page].presence || 1)
		end  
	end	
	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article Updated Successfully"
		  @article = index
			render :index
		else
			flash[:notice] = "Article Updation failure"
			render :edit
		end
	end	

	private
	def article_params
		params.require(:article).permit(:title,:content,:is_publish)
	end	
end
