class BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end

  def new
  bike = Bike.new
  end

  def show
    @bike = Bike.find.where(params[:id])
  end

end
