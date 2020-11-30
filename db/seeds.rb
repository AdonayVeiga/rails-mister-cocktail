require 'json'
require 'open-uri'

puts 'Removing existing ingredients'
Ingredient.destroy_all

puts 'Fetching ingredients from web'
ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']
puts "Received #{ingredients.length} ingredients}"

print 'Populating the database'
ingredients.each_with_index do |value, index|
  Ingredient.create(name: value.values[0])
  print '.' if (index % 5).zero?
end

puts 'All done'
