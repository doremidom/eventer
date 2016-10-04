class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash.now[:success] = "account created"
      redirect_to events_path
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])

    @current_hosted_events = @user.current_hosted_events 
    @current_attended_events = @user.current_attended_events
    @past_attended_events = @user.past_attended_events
    @past_hosted_events = @user.past_hosted_events



  end

  private



  def user_params
  	params.require(:user).permit(:username)
  end

end
