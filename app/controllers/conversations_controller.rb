class ConversationsController < ApplicationController
  def index
    @conversations = (Conversation.where(user_id: current_user.id) + Conversation.where(inbox_id: current_user.inbox.id)).delete_if {|c| c.messages.empty? }.sort_by! {|c| c.messages.last.created_at}
    @conversations = @conversations.paginate(page: params[:page], per_page: 5)
  end

  def create
    @receiver = User.find(params[:user_id])
    @user = User.find_by(id: session[:user_id])
    @conversation = @user.conversations.create
    @conversation.inbox_id = @receiver.inbox.id
    if @conversation.save
      redirect_to conversation_path(@conversation)
    end
  end


  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.all
  end
end
