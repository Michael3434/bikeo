class MessagesController < ApplicationController
  brefore_action :authenticate_user!
  brefore_action :set_conversation

  def index
    if current_user == @conversation.sender || current_user == @conversation.recipient
    @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
    @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversation_path, alert: "You don't have the permission to view this."
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order("created_at DESC")
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
