require "faker"
require "open-uri"
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
  { email: "maria@example.com",
    password: "123456",
    status: 0,
    location: "Higashimuki-nakamachi, Nara, Nara Prefecture, 630-8215, Japan" },
  { email: "mmak@example.com" , password: "123456", status: 0 },
  { email: "jun@example.com",
    password: "123456",
    status: 1,
    location: "Tarumi Ward, Kobe, Hyōgo Prefecture, Japan" },
  { email: "jay@example.com", password: "123456" , status: 0 }
            ])
puts "Created four amazing users"

puts "seeding 10 shops..."

Shop.create(
  name: "Shirochan",
  address: "Shioyacho 3-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0861, Japan",
  category: "misoshiru",
  description: "Umai Yasui Teishoku",
  user: User.third
)

Shop.create(
  name: "Micchan",
  address: "Shioyacho 4-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "izakaya",
  description: "Umai Yasui Yakitori",
  user: User.third
)

Shop.create(
  name: "Pizza Akiratsch",
  address: "Shioyacho 6-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "resutoran",
  description: "Umai Yasui Pizza",
  user: User.third
)

Shop.create(
  name: "Miki",
  address: "3-6-28 Shioyacho, Tarumi Ward, Kobe, Hyogo 655-0872",
  category: "okonomiyaki",
  description: "Umai Yasui Okonomiyaki",
  user: User.third
)

Shop.create(
  name: "Ryu Cafe",
  address: "3-8-4 Shioyacho, Tarumi Ward, Kobe, Hyogo 655-0872",
  category: "resutoran",
  description: "Umai Yasui Taiwanese",
  user: User.third
)

Shop.create(
  name: "Tokonatsu",
  address: "Shioyacho 7-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "izakaya",
  description: "Umai Yasui Izakaya",
  user: User.third
)

shopseven = Shop.create(
  name: "Hair Works Cool",
  address: "Shioyacho 8-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "biyoshitsu",
  description: "Umai Yasui barber",
  user: User.third
)
img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676546056/hairworkscool_n6pd3v.jpg")
shopseven.photo.attach(io: img, filename: "picture")

Shop.create(
  name: "Wanda Curry Shop",
  address: "Shioyacho 1-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0861, Japan",
  category: "kare-raisu",
  description: "Umai Yasui curry",
  user: User.third
)

Shop.create(
  name: "Mini-tomato",
  address: "Shioyacho 5-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "baiten",
  description: "Umai Yasui grocer",
  user: User.third
)


Shop.create(
  name: "Hiramatsu Tatami Shop",
  address: "Shioyacho 2-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "baiten",
  description: "Umai Yasui furniture",
  user: User.third
)

puts "Generated 10 shops"


puts "Creating stamp rallies..."

StampRally.create(
  name: "Shioya Stamp Rally winter 2022",
  description: "Winter stamp rally, enjoy japanese food with some winter decorations and seasonal food",
  start_date: "2022-11-20",
  end_date: "2022-12-10",
  user: User.third
)

StampRally.create(
  name: "Shioya Stamp Rally spring 2023",
  description: "Celebrate the arrival of spring at Shioya Street!",
  start_date: "2023-02-01",
  end_date: "2022-03-20",
  user: User.third
)

StampRally.create(
  name: "Shioya Stamp Rally summer 2023",
  description: "Enjoy fireworks with the best food of Shioya Street",
  start_date: "2023-06-01",
  end_date: "2023-06-20",
  user: User.third
)


# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:

puts "Creating shop participants..."


# SHIOYA RALLY ID:1
rally1_count = 0
until rally1_count == 5
  ShopParticipant.create(
    shop_id: "#{rally1_count + 1}",
    stamp_rally_id: 1
  )
  rally1_count += 1
end

puts "Created participants for stamp rally with id 1"

# SHIOYA RALLY ID:2
rally2_count = 0
until rally2_count == 7
  ShopParticipant.create(
    shop_id: "#{rally2_count + 1}",
    stamp_rally_id: 2
  )
  rally2_count += 1
end

puts "Created participants for stamp rally with id 2"


# SHIOYA RALLY ID:3
rally3_count = 0
until rally3_count == 10
  ShopParticipant.create(
    shop_id: "#{rally3_count + 1}",
    stamp_rally_id: 3
  )
  rally3_count += 1
end

puts "Created participants for stamp rally with id 3"

puts "Finished!"
