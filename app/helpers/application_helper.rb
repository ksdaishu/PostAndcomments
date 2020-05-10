module ApplicationHelper
	def login_helper
        link_to "logout", destroy_user_session_path , method: :delete     		
	end

	def full_title(page_title = '')
  		base_title = 'Post and Command'
  		if page_title.empty?
    		base_title
  		else
    		page_title + " | " + base_title
  		end
	end

end
