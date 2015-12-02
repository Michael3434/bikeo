class BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end
  def new
  bike = Bike.new
  end

  def show
    @bike = Bike.find(params[:id])
    @photos = @bike.photos
  end

end
