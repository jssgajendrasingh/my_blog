class Admin::UsersController < ApplicationController
	def index
		@user = User.all
	end	
	def edit
		@user = User.find(params[:id])
	end	

	def update
		#byebug
		user = User.find(params[:id])
		if user.update(user_params)
			flash[:notice] = "User Record Update Successfully"
		else
			flash[:notice] = "User Updation is failure"	
		end
		redirect_to admin_users_path	
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:about,:email)
	end	
end
