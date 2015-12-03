class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    bike = @photo.bike

    @photo.destroy
    @photos = Photo.where(bike_id: bike.id)

    respond_to :js

  end

end
