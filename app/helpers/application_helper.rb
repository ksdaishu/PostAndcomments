module ApplicationHelper
	def login_helper
          link_to "logout", destroy_user_session_path , method: :delete      		
	end
end
