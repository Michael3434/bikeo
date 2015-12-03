class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def preload
    bike = Bike.find(params[:bike_id])
    today = Date.today
    reservations = bike.reservations.where("start_date >= ? Or end_date >= ?", today, today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date)
    }

    render json: output
  end

def create
  @reservation = current_user.reservations.create(reservation_params)

  redirect_to @reservation.bike, notice: "Your reservation has been created"
end



private

def is_conflict(start_date, end_date)
  bike = Bike.find(params[:bike_id])

  check = bike.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
  check.size >0? true : false
end

def reservation_params

  params.require(:reservation).permit(:start_date, :end_date, :price, :total, :bike_id)

end

end
