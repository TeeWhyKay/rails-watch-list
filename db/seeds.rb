# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
# https://image.tmdb.org/t/p/original/2CAL2433ZeIihfX1Hb2139CX0pW.jpg
puts 'starting to seed movies from tmdb'
top_rated_movies = JSON.parse(URI.open('http://tmdb.lewagon.com/movie/top_rated').read)

top_rated_movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
puts 'seeding top movies complete'
