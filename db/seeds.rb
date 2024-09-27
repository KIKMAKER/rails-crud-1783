# db/seeds.rb

# Clear existing data
# Movie.destroy_all
puts "All movies have been deleted!"

# Seed movie data
movies = [
  { title: "Inception", rating: 9, director: "Christopher Nolan" },
  { title: "The Matrix", rating: 10, director: "The Wachowskis" },
  { title: "Interstellar", rating: 9, director: "Christopher Nolan" },
  { title: "Parasite", rating: 10, director: "Bong Joon-ho" },
  { title: "The Dark Knight", rating: 9, director: "Christopher Nolan" },
  { title: "Pulp Fiction", rating: 8, director: "Quentin Tarantino" }
]

movies.each do |movie|
  Movie.create!(movie)
  puts "Created movie: #{movie[:title]} by #{movie[:director]} with rating #{movie[:rating]}"
end

puts "Seeding completed! #{Movie.count} movies created."
