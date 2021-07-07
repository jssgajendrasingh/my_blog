class Admin::ArticlesController < ApplicationController
	def index
		@article = Article.all
	end	
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article Updated Successfully"
		else
			flash[:notice] = "Article Updation failure"
		end
		redirect_to admin_articles_path		
	end	
	private
	def article_params
		params.require(:article).permit(:title,:content,:is_publish)
	end	
end
