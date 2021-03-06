class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authorize
  before_action :current_user
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def authorize
  	unless current_user 
			flash[:notice] = "Please Login before perform actions"
  		redirect_to admin_login_path
  	end
 	  return 	
 end
 
end
