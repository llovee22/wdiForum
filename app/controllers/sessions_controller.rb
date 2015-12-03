class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:login][:username])

    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id.to_s
      redirect_to homepage_path
    else
      redirect_to login_path
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to homepage_path
  end

end
