class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by(username: params[:session][:username])
  	if user 
        log_in user  
        redirect_to root_path
  	else
  		flash.now[:danger] = 'Invalid username'
  		render 'new'
  	end
  end

  def destroy
  end

  private

  def log_in(user)
    session[:user_id] = user.id 
  end

end
