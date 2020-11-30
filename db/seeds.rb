require 'json'
require 'open-uri'

puts "Ok let's clean up the mess first"
Ingredient.delete_all
puts "Now let's come up with some ingredients"

api_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

open(api_url) do |stream|
  ingredients = JSON.parse(stream.read)
  ingredients["drinks"].each do |ingredient|
    Ingredient.create!(
      name: ingredient["strIngredient1"]
    )
  end
end

puts "All done!"
