# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Car.destroy_all

cars_api = "https://freetestapi.com/api/v1/cars"
cars_serialized = URI.parse(cars_api).read
cars = JSON.parse(cars_serialized)
cars.each do |car|
  owner = Owner.create!(nickname: Faker::Name.first_name)
  Car.create!(brand: car["make"], model: car["model"], year: car["year"], fuel: car["fuelType"], owner_id: owner.id, img_url: "cars/#{car['model']}.jpg" )
end
