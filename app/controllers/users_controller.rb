class UsersController < ApplicationController
  def show
    if logged_in?
      @user = current_user
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
        redirect_to root_path
    else
      flash[:error] = "Invalid sign up parameters"
      render action "new"
    end
  end
end


 def user_params
    params.require(:user).permit(:username, :password)
  end
