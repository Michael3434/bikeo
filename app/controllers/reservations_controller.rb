class ReservationsController < ApplicationController
  before_action :authenticate_user!

def create
  @reservation = current_user.reservations.create(reservation_params)

  redirect_to @reservation.bike
end



private

def reservation_params

  params.require(:reservation).permit(:start_date, :end_date, :price, :total, :bike_id)

end

end