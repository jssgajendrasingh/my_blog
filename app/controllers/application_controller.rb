class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authorize

  def current_user
   @user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def authorize
  	unless current_user 
			flash[:notice] = "Please Login before perform actions"
  		redirect_to admin_login_path
  	end
 	  return 	
 end
 
end
