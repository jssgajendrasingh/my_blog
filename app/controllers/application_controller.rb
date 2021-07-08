class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authorize

  def current_user
   @user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def authorize
  	unless current_user 
  		redirect_to new_admin_session_path
  	end
 	  return 	
 end
end
