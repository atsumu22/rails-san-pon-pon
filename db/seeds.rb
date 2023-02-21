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
    street_name: "Shioya Street",
    location: "Tarumi Ward, Kobe, Hyōgo Prefecture, Japan" },
  { email: "jay@example.com", password: "123456" , status: 0 }
            ])
puts "Created four amazing users"


puts "1. Seeding 9 shops for Shioya Street..."

shopone = Shop.create(
  name: "Shirochan",
  address: "Shioyacho 3-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0861, Japan",
  category: "Teishoku",
  category_icon: "misoshiru",
  description: "Umai Yasui Teishoku",
  user: User.third
)

imgone = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/Shirochan_ii75ig.jpg")
shopone.photo.attach(io: imgone, filename: "photo")

shoptwo = Shop.create(
  name: "Micchan",
  address: "Shioyacho 4-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Umai Yasui Yakitori",
  user: User.third
)
imgtwo = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676689092/michan_isqcli.png")
shoptwo.photo.attach(io: imgtwo, filename: "photo")

shopthree = Shop.create(
  name: "Pizza Akiratsch",
  address: "Shioyacho 6-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Umai Yasui Pizza",
  user: User.third
)
imgthree = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/pizzaakiratsch_h4vpsb.jpg")
shopthree.photo.attach(io: imgthree, filename: "photo")

shopfour = Shop.create(
  name: "Miki",
  address: "3-6-28 Shioyacho, Tarumi Ward, Kobe, Hyogo 655-0872",
  category: "Okonomiyaki",
  category_icon: "okonomiyaki",
  description: "Umai Yasui Okonomiyaki",
  user: User.third
)
imgfour = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/miki_jrakqj.jpg")
shopfour.photo.attach(io: imgfour, filename: "photo")

shopfive = Shop.create(
  name: "Ryu Cafe",
  address: "3-8-4 Shioyacho, Tarumi Ward, Kobe, Hyogo 655-0872",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Umai Yasui Taiwanese",
  user: User.third
)
imgfive = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/ryucafe_bjutdy.jpg")
shopfive.photo.attach(io: imgfive, filename: "photo")

shopsix =Shop.create(
  name: "Tokonatsu",
  address: "Shioyacho 7-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Umai Yasui Izakaya",
  user: User.third
)
imgsix = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676689092/Tokonatsu_hmrrtv.jpg")
shopsix.photo.attach(io: imgsix, filename: "photo")

shopseven = Shop.create(
  name: "Hair Works Cool",
  address: "Shioyacho 8-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Hair salon",
  category_icon: "biyoshitsu",
  description: "Umai Yasui barber",
  user: User.third
)
imgseven = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676546056/hairworkscool_n6pd3v.jpg")
shopseven.photo.attach(io: imgseven, filename: "photo")

shopeight = Shop.create(
  name: "Wanda Curry",
  address: "Shioyacho 1-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0861, Japan",
  category: "Curry",
  category_icon: "kare-raisu",
  description: "Umai Yasui curry",
  user: User.third
)
imgeight = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/wandacurry_i8419z.jpg")
shopeight.photo.attach(io: imgeight, filename: "photo")

shopnine = Shop.create(
  name: "Mini-tomato",
  address: "Shioyacho 5-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Shop",
  category_icon: "baiten",
  description: "Umai Yasui grocer",
  user: User.third
)
imgnine = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/minitomate_wl1xln.jpg")
shopnine.photo.attach(io: imgnine, filename: "photo")



puts "Generated 9 shops for Shioya Street"


puts "Creating stamp rallies in Shioya Area"

StampRally.create(
  name: "Shioya Stamp Rally winter 2022",
  description: "Winter stamp rally, enjoy japanese food with some winter decorations and seasonal food",
  start_date: "2022-11-20",
  end_date: "2022-12-10",
  user: User.third,
  location: User.third.location
)

StampRally.create(
  name: "Shioya Stamp Rally spring 2023",
  description: "Celebrate the arrival of spring at Shioya Street!",
  start_date: "2023-02-01",
  end_date: "2023-03-20",
  user: User.third,
  location: User.third.location
)

StampRally.create(
  name: "Shioya Stamp Rally summer 2023",
  description: "Enjoy fireworks with the best food of Shioya Street",
  start_date: "2023-06-01",
  end_date: "2023-06-20",
  user: User.third,
  location: User.third.location
)

puts "Created stamp rallies in Shioya Area"


# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants..."

# SHIOYA RALLY ID:1
rally1_count = 0
n = 0
until rally1_count == 5
  ShopParticipant.create(
    shop: Shop.all[rally1_count],
    stamp_rally: StampRally.first,
    qr_code: "#{n}/stamped"
  )
  rally1_count += 1
  n += 1
end

puts "Created participants for stamp rally with id 1"

# SHIOYA RALLY ID:2
rally2_count = 0
until rally2_count == 7
  ShopParticipant.create(
    shop: Shop.all[rally2_count],
    stamp_rally: StampRally.second,
    qr_code: "#{n}/stamped"
  )
  rally2_count += 1
  n += 1
end

puts "Created participants for stamp rally with id 2"


# SHIOYA RALLY ID:3
rally3_count = 0
until rally3_count == 10
  ShopParticipant.create(
    shop: Shop.all[rally3_count],
    stamp_rally: StampRally.third,
    qr_code: "#{n}/stamped"
  )
  rally3_count += 1
  n += 1
end

# STAMP CARD for each ShopParticipant


puts "Created participants for stamp rally with id 3"
puts "Created data for Shioya Shops"

puts "2. Seeding 8 shops for Naramachi..."

nara1 = Shop.create(
  name: "Fuku Roku Dou",
  address: "〒630-8215 Nara, Higashimuki Nakamachi, 27 HIKARIビル1～3F",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Castella shop",
  user: User.first
)

# nara1 = URI.open("")
# nara1.photo.attach(io: imgnine, filename: "photo")


nara2 = Shop.create(
  name: "Cafe FLUKE",
  address: "奈良市東向中町10",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Retro coffee in Naramachi",
  user: User.first
)

# nara2 = URI.open("")
# nara2.photo.attach(io: imgnine, filename: "photo")


nara3 = Shop.create(
  name: "奈良ism",
  address: "東向南町23-2",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Newly open izakaya in Naramachi with regional food, more than 70 different dishes!",
  user: User.first
)

# nara3 = URI.open("")
# nara3.photo.attach(io: imgnine, filename: "photo")


nara4 = Shop.create(
  name: "HEX HIVE",
  address: "奈良市東向南町3",
  category: "Shop",
  category_icon: "baiten",
  description: "Second hand articles",
  user: User.first
)

# nara4 = URI.open("")
# nara4.photo.attach(io: imgnine, filename: "photo")


nara5 = Shop.create(
  name: "Oshaberi na kame",
  address: "奈良市東向南町28-1",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Retro coffee shop with very yummy omurice",
  user: User.first
)

# nara5 = URI.open("")
# nara5.photo.attach(io: imgnine, filename: "photo")


nara6 = Shop.create(
  name: "Ramen K",
  address: "9 Komyoincho, Nara, 630-8371",
  category: "Ramen",
  category_icon: "ramen",
  description: "Speciality ramen",
  user: User.first
)

# nara6 = URI.open("")
# nara6.photo.attach(io: imgnine, filename: "photo")

puts "Generated 6 shops for Naramachi"

puts "Creating stamp rallies in Naramachi"

StampRally.create(
  name: "Naramachi Winter 2022",
  description: "Winter stamp rally, enjoy japanese food with some winter decorations and seasonal food",
  start_date: "2022-1-20",
  end_date: "2022-2-10",
  user: User.first,
  location: User.first.location
)

StampRally.create(
  name: "Naramachi deer festival",
  description: "Shops reunited to get donations for deer association",
  start_date: "2023-2-10",
  end_date: "2023-3-20",
  user: User.first,
  location: User.first.location
)

puts "Created stamp rallies in Naramachi"

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants..."

# SHIOYA RALLY ID:1
rally1_count = 10
n = 10

until rally1_count == 15
  ShopParticipant.create(
    shop: Shop.all[rally1_count],
    stamp_rally: StampRally.last,
    qr_code: "#{n}/stamped"
  )
  rally1_count += 1
  n += 1
end

puts "Created participants for stamp rally with id 1"

puts "Finished!"
