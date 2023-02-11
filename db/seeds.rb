require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database..."
Shop.destroy_all
User.destroy_all

puts "Creating users..."

User.create([
  { email: "maria@example.com", password: "123456", status: 0 },
  { email: "mmak@example.com" , password: "123456", status: 0 },
  { email: "jun@example.com", password: "123456", status: 1 },
  { email: "jay@example.com", password: "123456" , status: 0 }
            ])
puts "Created four amazing users"

puts "seeding 10 shops..."

Shop.create(
  name: "Shirochan",
  address: "1-1 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "Teishoku",
  description: "Umai Yasui Teishoku",
  user: User.third
)

Shop.create(
  name: "Micchan",
  address: "1-2 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "Yakitori",
  description: "Umai Yasui Yakitori",
  user: User.third
)

Shop.create(
  name: "Pizza Akiratsch",
  address: "1-3 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "Pizza",
  description: "Umai Yasui Pizza",
  user: User.third
)

Shop.create(
  name: "Miki",
  address: "1-4 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "Okonomiyaki",
  description: "Umai Yasui Okonomiyaki",
  user: User.third
)

Shop.create(
  name: "Ryu Cafe",
  address: "1-5 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "Taiwanese",
  description: "Umai Yasui Taiwanese",
  user: User.third
)

Shop.create(
  name: "Tanaka Tofu",
  address: "1-6 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "Tofu",
  description: "Umai Yasui Tofu",
  user: User.third
)

Shop.create(
  name: "Hair Works Cool",
  address: "1-7 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "barber",
  description: "Umai Yasui barber",
  user: User.third
)

Shop.create(
  name: "Wanda Curry Shop",
  address: "1-8 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "curry",
  description: "Umai Yasui curry",
  user: User.third
)

Shop.create(
  name: "mini-tomato",
  address: "1-9 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "grocer",
  description: "Umai Yasui grocer",
  user: User.third
)

Shop.create(
  name: "Hiramatsu Tatami Shop",
  address: "1-10 Shioyacho, Tarumiku, Kobe, Hyogo",
  category: "furniture",
  description: "Umai Yasui furniture",
  user: User.third
)

puts "Finished!"
