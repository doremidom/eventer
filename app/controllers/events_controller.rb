class EventsController < ApplicationController
  before_action :logged_in_user, only:[:create]

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.valid? 
  		@event.save
  		flash.now[:success] = "Event created!"
  		redirect_to users_show_path
  	else
  		flash[:danger] = "Invalid submission"
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  def index
  	@events = Event.all 
  end

  private

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

  def logged_in?
    !current_user.nil?
  end

  def event_params
  	params.require(:event).permit(:title, :description)
  end
end
