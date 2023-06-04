require 'faker'
require "json"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Movie.destroy_all

puts "create Movies"

# Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)


# puts 'Creating 15 fake movies...'
# 15.times do
#   movie = Movie.new(
#     title:    Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     rating:  rand(0..10)
#   )
#   movie.save!
# end
puts "start API"

url = "http://tmdb.lewagon.com/movie/top_rated"
result_serialized = URI.open(url).read
# if needed puts puts right done to be seen with rails c
result = JSON.parse(result_serialized)
# que voulons nous de l'api, on veut lire les valeurs de la clef results, on veut lire tous ce qui se trouvent dans l'array results
# if needed puts puts right done to be seen with rails c
movies = result['results']

movies.each do |movie|
  film = Movie.create!(title: movie["title"], overview: movie["overview"], rating: movie[:vote_average], poster_url: movie[:poster_path])
end

puts "movies created"
puts "seeds done"
