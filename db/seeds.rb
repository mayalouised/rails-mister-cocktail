# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_serialized = open(url).read
drink = JSON.parse(drink_serialized)
ingredients = drink["drinks"]

ingredients.each do |ingredient|
  drink_ingredient = ingredient["strIngredient1"]
  new_ingredient = Ingredient.create(name: drink_ingredient)
  p "Created new ingredient #{new_ingredient}"
end

