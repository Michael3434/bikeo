# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all
addresses = ["11, Port de Bercy Aval, 75012 Paris",
 "Port d'Orsay Solférino, 75006 PARIS",
 "5 port de la Râpée, 75012 Paris",
 "23, rue Taitbout, 75009 Paris",
 "16 Boulevard Haussmann, 75009 Paris",
 "",
 "3, rue des Saussaies, 75008 Paris",
 "17, rue du Colisée 75008 Paris",
 "1 rue des Fossés Saint-Bernard, 75005 Paris",
 "3 quai Malaquais, 75006 Paris",
 "70 Avenue des Champs-Elysées, 75008 Paris",
 "50 route de l'Etoile, 75016 Paris",
 "188bis, rue de Rivoli, 75001 Paris",
 "Jardin d'acclimatation, 75016 Paris",
 "Ile de Reuilly - Bois de Vincennes, 75012 Paris",
 "69 Avenue Daumesnil,  75012 Paris ",
 "33 Avenue du Maine, 75015 Paris",
 "Port de Debilly, 75007 Paris",
 "Port des Saints-Pères, 75006 Paris",
 "15 Quai de la Tournelle, 75005 Paris",
 "4 rue Arsène Houssaye, 75008 Paris",
 "34, avenue de New York, 75016 Paris",
 "47 rue Cuvier, 75005 Paris",
 "14 Rue Saint-Fiacre, 75002 Paris",
 "18, rue Daunou, 75002 Paris",
 "12 rue de Poitiers, 75007 Paris",
 "Denfer-Rochereau, 75014 Paris",
 "Bois de Vincennes, Île des Minimes, 75012 Paris",
 "20, rue Quentin Bauchard 75008",
 "217, Boulevard Saint-Germain, 75007 Paris",
 "5 Rue de la Paix, 75002 Paris",
 "42, rue de la Roquette, 75011 Paris",
 "211, avenue Jean Jaurès, 75019 Paris",
 "66 rue Jean Jacques Rousseau, 75001 Paris",
 "Port de Javel Haut, 75015 Paris",
 "6, avenue Georges Mandel, 75016 Paris",
 "Port de Bercy, 75012 Paris",
 "Port de Suffren, 75015 Paris",
 "42 route de Sèvres à Neuilly, 75016 Paris",
 "81 rue des archives, 75003 Paris",
 "2, rue Frochot, 75009 Paris",
 "16 boulevard Haussmann, 75009 Paris",
 "9 avenue Hoche, 75008 Paris",
 "9, avenue Hoche, 75008 Paris",
 "40, avenue de Friedland, 75008 Paris",
 "80, boulevard Rochechouart, 75018 PARIS",
 "1 Rue Ambroise Thomas 75009 Paris",
 "Bord de Seine, 75001 PARIS",
 "3 Port Debilly, 75116 Paris",
 "59, avenue raymond poincaré 75016 paris",
 "14, rue des Jardins Saint Paul, 75004 Paris",
 "Bois de Boulogne, 75016 Paris",
 "20 rue Lafayette, 75009 Paris",
 "94, Boulevard Auguste Blanqui 75013 Paris",
 "Port de la Rapée, 75012 Paris",
 "8, rue Jan Goujon, 75008 Paris",
 "Port Henri IV, 75004 Paris",
 "Orée du bois de Vincennes, 75012 Paris",
 "22 rue de l'Université, 75007 Paris",
 "7 Rue Linois, 75015 Paris",
 "12, rue du Renard, 75004 Paris",
 "8, rue de Valois 75001 Paris",
 "Port de Solférino, 75007 Paris",
 "Quai de Montebello, 75005 Paris",
 "Entrée Place Armand Carrel, 75019 Paris",
 "50, route de l'Etoile, 75016 Paris",
 "2 rue des Anglais, 75005 Paris",
 "57 quai de la Seine, 75019 Paris",
 "158 boulevard Haussmann, 75008 Paris",
 "5 Rue Saint Eleuthère, 75018 Paris",
 "12 rue La Fayette, 75009 Paris",
 "105 rue du Faubourg Saint Honoré, 75008 Paris",
 "12, rue La Fayette, 75009 Paris",
 "66 rue Pelleport, 75020 Paris",
 "2, faubourg Poissonnière, 75009 Paris",
 "13, passage Jouffroy, 75009 Paris",
 "24, rue Vavin, 75006 Paris",
 "47, avenue de Wagram, 75017 Paris",
 "98 Quai de la Rapée, 75012 Paris",
 "51-51 Rue de Courcelles, 75008 Paris",
 "7 rue Froissart, 75003 Paris",
 "25 rue Le Peletier, 75009 Paris",
 "Port de la Bourdonnais, 75007 Paris",
 "51 Avenue de Gravelle, 75012 Paris",
 "Place du Maréchal de Lattre de Tassigny, 75016 Paris",
 "10 allée du Bord de l'Eau, 75016 Paris",
 "75 Rue de Lourmel, 75015 Paris",
 "24 rue Saint-Victor, 75005 Paris",
 "2 rue Scribe, 75009 Paris",
 "18 rue St Rustique, 75018 Paris"]


 x = 1
 30.times do
   names = ('a'..'z').to_a
   bike = Bike.create(
     user_id: 1,
     category: ["Cruiser", "Road", "Mountain", "Fixed", "Gear"].sample,
     size: ["121cm", "129cm", "137cm"].sample,
     title: names[x],
     description: ["Perfectly conditioned for immediate ride. Equipped with Wahoo Fitness Blue SC Speed and Cadence Sensor for cycle logs with your favorite fitness app. Shimano SPD pedals also available as free option.", "Completely Stock size XXL: The Crosstrail is up for all your after work rides and weekend adventures, regardless of the terrain, with fast rolling but confident 38c tires and 60mm of front suspension featuring hydraulic lockout and Multi-Circuit Damping."].sample,
     price_day: [10, 12, 14, 5].sample,
     address: addresses[x],
     is_lock: true
   )

   bike.photos.create(
     image: File.new("#{Rails.root}/app/assets/images/bikes/bike#{x}.jpg")
     )
   x += 1
   p "#{bike.id} created !"
 end


