# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all

i = 1
10.times do
  bike = Bike.create(
    user_id: 1,
    category: ["Cruiser", "Road", "Mountain", "Fixed", "Gear"].sample,
    size: ["121cm", "129cm", "137cm"].sample,
    title: ["Fancy bike", "Awesome bike", "Bike bro", "BikyBiky"].sample,
    description: ["Perfectly conditioned for immediate ride. Equipped with Wahoo Fitness Blue SC Speed and Cadence Sensor for cycle logs with your favorite fitness app. Shimano SPD pedals also available as free option.", "Completely Stock size XXL: The Crosstrail is up for all your after work rides and weekend adventures, regardless of the terrain, with fast rolling but confident 38c tires and 60mm of front suspension featuring hydraulic lockout and Multi-Circuit Damping."].sample,
    price_day: [10, 12, 14, 5].sample,
    address: ["Avenue de l'Indépendance Belge 80", "Gemeenteschool de kriek", "Avenue Louis Bertrand 89, 1030 Schaerbeek", "Rue de Ganshoren 39 1081 Koekelberg", "Rue de l'Eglise Sainte-Anne 82 1081 Koekelberg", "Rue des Fuchsias 121-125 1080 Molenbeek-Saint-Jean", "Félix Vande Sandestraat 54A 1081 Koekelberg"].sample,
    is_lock: true
  )

bike.photos.create(
  image: File.new("#{Rails.root}/app/assets/images/bikes/bike#{i}.jpg")
  )
i += 1

end

x = 1
10.times do
  bike = Bike.create(
    user_id: 1,
    category: ["Cruiser", "Road", "Mountain", "Fixed", "Gear"].sample,
    size: ["121cm", "129cm", "137cm"].sample,
    title: ["Fancy bike", "Awesome bike", "Bike bro", "BikyBiky"].sample,
    description: ["Perfectly conditioned for immediate ride. Equipped with Wahoo Fitness Blue SC Speed and Cadence Sensor for cycle logs with your favorite fitness app. Shimano SPD pedals also available as free option.", "Completely Stock size XXL: The Crosstrail is up for all your after work rides and weekend adventures, regardless of the terrain, with fast rolling but confident 38c tires and 60mm of front suspension featuring hydraulic lockout and Multi-Circuit Damping."].sample,
    price_day: [10, 12, 14, 5].sample,
    address: ["8th arrondissement of Paris", "28 Rue de Mogador, 75009", "32 Avenue Foch 75116 Paris", "35 Rue de Lisbonne, 75008 Paris, France", "7 Rue de Vézelay 75008 Paris", "107 Boulevard Malesherbes 75008 Paris", "4 Place du Général Catroux 75017 Paris"].sample,
    is_lock: true
  )

bike.photos.create(
  image: File.new("#{Rails.root}/app/assets/images/bikes/bike#{x}.jpg")
  )
x += 1

end
