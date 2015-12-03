class BikesController < ApplicationController
before_action :set_bike, only: [:edit,:update, :show, :destroy]
before_action :authenticate_user!, except: [:show]

  def index
    @bikes = Bike.all
  end

   def show
    @photos = @bike.photos
  end

  def new
    @bike = Bike.new

  end

  def destroy
    @bike.destroy
    redirect_to bikes_path
  end

  def create
    @bike = current_user.bikes.build(bike_params)

    if @bike.save
       if params[:image]
        params[:image].each do |image|
            @bike.photos.create(image: image)
          end
        end
      redirect_to root_path, notice: "Saved..."
    else
      render :new
    end
  end

  def edit
    @photos = @bike.photos
  end

  def update
    if @bike.update(bike_params)
      if params[:image]
        params[:image].each do |image|
            @bike.photos.create(image: image)
          end
        end
    redirect_to @bike, notice: "Updated..."
    else
      render :edit
    end
  end


private

  def set_bike
  @bike = Bike.find(params[:id])
  end
  def bike_params
    params.require(:bike).permit(:user_id, :size, :title, :description, :price_hour, :price_day, :price_week, :price_month, :price_year, :country, :city, :address, :zipcode, :state, :category, :is_lock, :is_helmet,:is_lights, :is_bell, :is_reflectors, :is_baskets, :is_trailers, :speed, :chain_wheel)
  end


end
