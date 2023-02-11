# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.destroy_all

puts "Creating users..."

User.create([
  { email: "maria@example.com", password: "123456" },
  { email: "mmak@example.com" , password: "123456" },
  { email: "jun@example.com", password: "123456" },
  { email: "jay@example.com", password: "123456"  }
            ])
puts "Created four amazing users"
