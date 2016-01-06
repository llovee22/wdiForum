class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversation_path(@conversation)
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @conversation = @message.conversation
    if current_user == @message.user
      if @message.update(message_params)
        redirect_to conversation_path(@conversation)
      else
        render 'edit'
      end
    else
      redirect_to conversation_path(@conversation)
    end
  end



  def destroy
    @message = Message.find(params[:id])
    @conversation = @message.conversation
    if current_user = @message.user
      @message.destroy
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversation_path(@conversation)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
