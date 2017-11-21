class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    # fix
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(receipt.conversation)
    # redirect_to conversations_url
  end
  def destroy
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.destroy
    redirect_to root_url
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
