class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

def current_user
    if (user_id = session[:user_id])
  			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
  			user = User.find_by(id: user_id)
  			if user && user.authenticated?(:remember, cookies[:remember_token])
    			log_in user
    			@current_user = user
  			
  			end
  		end
	end



private

def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
end