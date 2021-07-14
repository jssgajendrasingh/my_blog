class Admin::UsersController < ApplicationController
	load_and_authorize_resource
	def index
		@user = User.all
	end	
	def edit
		@user = User.find(params[:id])
	end	
	def new 

	end 

	def change_password
		@user = User.find(params[:id])
	end	

	def update_password
		binding.pry
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

	def show
		#binding.pry
		@user = User.find(params[:id])
	end	

	
	def make_super
		@u = User.find(params[:id])
		@u.update(super_admin: true)
		@user = User.all
	end

	private
	def user_params
		user = params[:user]
		password = user[:password]
		super_admin = user[:super_admin]
		if password == "" && super_admin == ""
			params.require(:user).permit(:first_name,:last_name,:about,:email)
		elsif password == ""
			params.require(:user).permit(:first_name,:last_name,:about,:email,:super_admin)
		else 
			params.require(:user).permit(:first_name,:last_name,:about,:email,:password)
		end
	end	
	
	def newuser_params
		user = params[:user]
		super_admin = user[:super_admin]
		if super_admin == ""
			params.require(:new).permit(:first_name,:last_name,:about,:email,:password)
		else
			params.require(:new).permit(:first_name,:last_name,:about,:email,:password,:super_admin)
		end		
	end	
end
