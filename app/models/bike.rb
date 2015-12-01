class Bike < ActiveRecord::Base
  validates :user_id, presence:true
  validates :size, presence:true
  validates :accessories, presence:true
  validates :title, presence:true
  validates :description, presence:true
  validates :price_hour, presence:true
  validates :price_day, presence:true
  validates :price_week, presence:true
  validates :price_month, presence:true
  validates :price_year, presence:true
  validates :country, presence:true
  validates :city, presence:true
  validates :address, presence:true
  validates :zipcode, presence:true
  validates :state, presence:true

  belongs_to :user

end
