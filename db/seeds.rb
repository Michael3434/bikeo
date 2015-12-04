# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i = 1
30.times do
  bike = Bike.create(
    user_id: 1,
    category: ["Cruiser", "Road", "Mountain", "Fixed", "Gear"].sample,
    size: ["121cm", "129cm", "137cm"].sample,
    title: ["Fancy bike", "Awesome bike", "Bike bro", "BikyBiky"].sample,
    description: ["Perfectly conditioned for immediate ride. Equipped with Wahoo Fitness Blue SC Speed and Cadence Sensor for cycle logs with your favorite fitness app. Shimano SPD pedals also available as free option.", "Completely Stock size XXL: The Crosstrail is up for all your after work rides and weekend adventures, regardless of the terrain, with fast rolling but confident 38c tires and 60mm of front suspension featuring hydraulic lockout and Multi-Circuit Damping."].sample,
    price_day: [10, 12, 14, 5].sample,
    address: ["Paris, Tour eiffele", "Chanps Elizees", "Paris, Champs de marse", "Paris, rue de rivolie"].sample,
    is_lock: true
  )

bike.photos.create(
  image: File.new("#{Rails.root}/app/assets/images/bikes/bike#{i}.jpg")
  )
i += 1

end
