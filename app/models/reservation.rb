class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :bike

  def reservation_time
     start_date.strftime("%v")
  end

  def lentgh_time
    (Date.parse(end_date.strftime("%v")) - Date.parse(start_date.strftime("%v"))).to_i + 1
  end
end
