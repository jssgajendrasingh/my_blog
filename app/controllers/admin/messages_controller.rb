class Admin::MessagesController < ApplicationController

	 def index
	 	@messages = Message.paginate(page: params[:page], per_page: 5)
	 end
	 
	 def destroy
	 	#binding.pry
	 	message = Message.delete(params[:id])
	 	if message
	 		flash[:notice] = "Message Delete Successfully"	
	 	else
	 		flash[:notice] = "Message Delete Failures"	
	 	end 
	 	redirect_to action: "index"
	 end	

end
