class PagesController < ApplicationController

  def home
    @bike = Bike.all
    @conversations = Conversation.involving(current_user) if current_user
    set_messages_unread
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
  end

  arrResult = Array.new

  if session[:loc_search] && session[:loc_search] != ""
      @bike_address = Bike.all.near(session[:loc_search], 5, order: 'distance')
  else
    @bike_address = Bike.all
  end

  @arrBikes = @bike_address.to_a

end


end
