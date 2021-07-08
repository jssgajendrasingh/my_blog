class Admin::SessionsController < ApplicationController
	before_action :authorize , except: [:new,:create]

	def new 
	end

	def create
		#binding.pry
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to admin_users_path
 		else
  		redirect_to admin_login_path
 		end
	end

	def destroy
		session[:user_id] = nil
  end
	
end
