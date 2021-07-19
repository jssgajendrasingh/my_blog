module ApplicationHelper

	def time_data(time)
		time_ago_in_words(time) + " " + "ago"
	end

  def article_publish(status, truthy: "", falsey: "")
  	if status
  		truthy
  	else
  		falsey
  	end
  end

  def tag_with_hash(name)
    return "#" + name
  end  
  

end
