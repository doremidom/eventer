module ApplicationHelper
	def log_in(user)
		session[:user_id] = user.id 
	end

	def logged_in?
    	!current_user.nil?
  end

  def current_user?(user)
		user == current_user
	end

	def current_user
    if (user_id = session[:user_id])
  			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
  			user = User.find_by(id: user_id)
  			if user && user.authenticated?(:remember, cookies[:remember_token])
    			log_in user
    			@current_user = user
          puts "im resetting current user like a bitch"
  			
  			end
  		end
	end

end
