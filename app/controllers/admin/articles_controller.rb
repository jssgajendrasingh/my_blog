class Admin::ArticlesController < ApplicationController
	load_and_authorize_resource
	def index
		@article = Article.paginate(page: params[:page], per_page: 5)
	end	
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article Updated Successfully"
		  @article = Article.paginate(page: params[:page], per_page: 5)
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
