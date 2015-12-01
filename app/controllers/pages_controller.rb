class PagesController < ApplicationController

  def home
    @bike = Bike.all
  end


end
