# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all

x = 1
3.times do
  bike = Bike.create(
    user_id: rand(1..1),
    category: "momo",
    size: "big",
    title: "French bike",
    description: "beau vélo tout neuf",
    price_hour: 10,
    price_day: 30,
    price_week: 150,
    price_month: 250,
    price_year: 1000,
    country: "France",
    city: "Paris",
    address: "3 rue du Four",
    zipcode: 75003,
    state: "ici"
    )
  Photo.create({
    image: File.new("#{Rails.root}/app/assets/images/bike#{x}.jpg"),
    bike: bike
})
  x += 1
end
