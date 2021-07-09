class Admin::UsersController < ApplicationController
	
	def index
		@user = User.all
	end	
	def edit
		@user = User.find(params[:id])
	end	
	def new 

	end 

	def create
		#binding.pry
		@user = User.create(newuser_params)
		redirect_to admin_users_path			
	end	
	def update
		#byebug
		user = User.find(params[:id])
		if user.update(user_params)
			flash[:notice] = "User Record Update Successfully"
			@user = User.all
			render :index	
		else
			flash[:notice] = "User Updation is failure"	
			render :edit
		end
		#redirect_to admin_users_path	
	end

	private
	def user_params
		user = params[:user]
		password = user[:password]
		if password == ""
			params.require(:user).permit(:first_name,:last_name,:about,:email)
		else
			params.require(:user).permit(:first_name,:last_name,:about,:email,:password)
		end
	end	
	
	def newuser_params
		params.require(:new).permit(:first_name,:last_name,:about,:email,:password)
	end	
end
