class Admin::ArticlesController < ApplicationController
	load_and_authorize_resource
	def index
		#@user = current_user
		#inding.pry
		if current_user.super_admin
			@articles = Article.paginate(page: params[:page], per_page: 5)
		else
			#binding.pry
		  @articles = Article.where(user_id: @current_user.id).paginate(per_page: 5, page: params[:page])
		end  
	end	

	def new
		@tags = Tag.all
	end
	
	def create
		binding.pry
		@article = @current_user.articles.create(article_params_new)
		artilce = params.require(:article)
		@tags = artilce[:tags]
	  @tags.each do |tag_id|
		   ArticleTag.create(article: @article,tag_id: tag_id)
		end 
		redirect_to action: "index"
	end	

	def show
		@article = Article.find(params[:id])
		@tags = @article.tags
	end

	def edit
		#binding.pry
		@user = current_user
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

	def search_article
		#binding.pry
		search = params[:Search]
		if search == "Title"
			@articles = Article.where('title LIKE ?',"%#{params[:q]}%").paginate(per_page: 5, page: params[:page])
		else
		  @articles = Article.where('content LIKE ?', "%#{params[:q]}%").paginate(per_page: 5, page: params[:page])
		end
		render :index
	end	

	private

	 def article_params
		params.require(:article).permit(:title,:content,:is_publish)
	 end	

   def article_params_new
  	params.require(:article).permit(:title,:content)
   end	
   

end
