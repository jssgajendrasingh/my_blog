class Admin::SessionsController < ApplicationController
	before_action :authorize , except: [:new,:create,:index]

	def new 
	end

	def index
	end	

	def create
		#binding.pry
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to root_path
 		else
 			flash[:error] = "email id and password is not match"
  		redirect_to root_path
 		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "User logout successfully"
		redirect_to root_path
  end
	
end
