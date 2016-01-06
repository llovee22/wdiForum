class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    if logged_in?
      @chat = @chatroom.chats.create(chat_params)
      @chat.user_id = current_user.id
      if @chat.save
        redirect_to chatroom_path(@chatroom)
      else
        redirect_to chatroom_path(@chatroom)
      end
    else
      redirect_to homepage_path
    end
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    @chatroom = @chat.chatroom
    if current_user == @chat.user
      if @chat.update(chat_params)
        redirect_to chatroom_path(@chatroom)
      else
        render 'edit'
      end
    else
      redirect_to chatroom_path(@chatroom)
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chatroom = @chat.chatroom
    if current_user = @chat.user
      @chat.destroy
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to chatroom_path(@chatroom)
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content)
  end
end
