# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@cities = ["Paris","Marseille","Lyon","Toulouse","Nice","Nantes","Montpellier","Strasbourg",
          "Bordeaux","Lille","Rennes","Reims","Le Havre","Saint-etienne","Toulon","Grenoble","Dijon","Angers","Nîmes","Villeurbanne","Saint-Denis",
          "Le Mans","Aix-en-Provence","Clermont-Ferrand","Brest","Tours","Limoges" ,"Amiens" ,"Annecy","Perpignan" ,"Boulogne-Billancourt",
          "Metz","Besançon","Orléans","Saint-Denis","Argenteuil","Mulhouse","Rouen","Montreuil","Caen"]
          

Game.create!(place: "Caen", date: "14/12/2018", game_format: "Legacy", description: "yogrogorgrg",
            latitude: Geocoder.search("Caen").first.coordinates.first, longitude: Geocoder.search("Caen").first.coordinates.last)


200.times do
  @city = @cities.sample
  results = Geocoder.search(@city)
  Game.create!(place: @city, date: "14/12/2018", game_format: "Legacy", description: "yogrogorgrg",
    latitude: results.first.coordinates.first, longitude: results.first.coordinates.last)
end
