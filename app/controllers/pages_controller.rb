class PagesController < ApplicationController

  def home
    @bike = Bike.all
    @conversations = Conversation.involving(current_user) if current_user
    set_messages_unread
  end

  def search

  end


end
