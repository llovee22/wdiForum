class UsersController < ApplicationController
  def index
    if !chatroom
      @chatroom = Chatroom.new
      @chatroom.save
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @surveys = @user.surveys
    if current_user
      @conversation = current_user.conversations.find_by_inbox_id(@user.inbox.id) || @user.conversations.find_by_inbox_id(current_user.inbox.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @inbox = Inbox.new
      @inbox.user_id = @user.id
      @inbox.save

      redirect_to login_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(id: session[:user_id])
      if @user.update(user_params)
        redirect_to user_information_path(@user)
      else
        render 'edit'
      end
  end

  private
  def user_params
    params.require(:user).permit(:username,:fname,:lname,:password,:user_type,:password_confirmation, :verification, :picture, :image, :remote_image_url)
  end
end
