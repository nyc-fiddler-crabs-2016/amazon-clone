class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Incorrect Username or Password"
        render action: "new"
      end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
