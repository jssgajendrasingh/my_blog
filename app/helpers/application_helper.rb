module ApplicationHelper

	def time_data(time)
		time_ago_in_words(time) + " " + "ago"
	end

  def article_publish(status)
  	status == true ? "Approved" : "Unapproved"
  end	

end
