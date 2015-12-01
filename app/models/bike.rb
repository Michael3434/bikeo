class Bike < ActiveRecord::Base
  validate :user_id, presence:true
  validate :type, presence:true
  validate :size, presence:true
  validate :accessories, presence:true
  validate :title, presence:true
  validate :description, presence:true
  validate :price_hour, presence:true
  validate :price_day, presence:true
  validate :price_week, presence:true
  validate :price_month, presence:true
  validate :price_year, presence:true
  validate :country, presence:true
  validate :city, presence:true
  validate :address, presence:true
  validate :zipcode, presence:true
  validate :state, presence:true

  belongs_to :user

end
