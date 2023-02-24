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
    name: "Maria",
    password: "123456",
    status: 0,
    location: "Higashimuki-nakamachi, Nara, Nara Prefecture, 630-8215, Japan" },

  { email: "mmak@example.com",
    name: "Mariama",
    password: "123456",
    status: 0 },

  { email: "jun@example.com",
    name: "Junsuke",
    password: "123456",
    status: 1,
    street_name: "Shioya Street",
    location: "Tarumi Ward, Kobe, Hyōgo Prefecture, Japan" },

  { email: "jay@example.com",
    name: "Jeremy",
    password: "123456",
    status: 0 }
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
  location: User.third.location,
  reward: "20% discount at once"
)

StampRally.create(
  name: "Shioya Stamp Rally spring 2023",
  description: "Celebrate the arrival of spring at Shioya Street!",
  start_date: "2023-02-01",
  end_date: "2023-03-20",
  user: User.third,
  location: User.third.location,
  reward: "10% discount for eat-in at once"
)

StampRally.create(
  name: "Shioya Stamp Rally summer 2023",
  description: "Enjoy fireworks with the best food of Shioya Street",
  start_date: "2023-06-01",
  end_date: "2023-06-20",
  user: User.third,
  location: User.third.location,
  reward: "exchanging with the original towel"
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
    address: Shop.all[rally1_count].address,
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
    address: Shop.all[rally2_count].address,
    stamp_rally: StampRally.second,
    qr_code: "#{n}/stamped"
  )
  rally2_count += 1
  n += 1
end

puts "Created participants for stamp rally with id 2"


# SHIOYA RALLY ID:3
rally3_count = 0
until rally3_count == 9
  ShopParticipant.create(
    shop: Shop.all[rally3_count],
    address: Shop.all[rally3_count].address,
    stamp_rally: StampRally.third,
    qr_code: "#{n}/stamped"
  )
  rally3_count += 1
  n += 1
end

# STAMP CARD for each ShopParticipant

# NARAMACHI
puts "Created participants for stamp rally with id 3"
puts "Created data for Shioya Shops"

puts "..."

puts "2. Seeding 6 shops for Naramachi..."

nara1 = Shop.create(
  name: "Fuku Roku Dou",
  address: "27 Kamisanjocho, Nara, 630-8228",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Castella shop",
  user: User.first
)

# nara1 = URI.open("")
# nara1.photo.attach(io: imgnine, filename: "photo")


nara2 = Shop.create(
  name: "Cafe FLUKE",
  address: "10 Higashimuki Nakamachi, Nara, 630-8215",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Retro coffee in Naramachi",
  user: User.first
)

# nara2 = URI.open("")
# nara2.photo.attach(io: imgnine, filename: "photo")


nara3 = Shop.create(
  name: "奈良ism",
  address: "Kintetsu Nara, 行基広場, Higashimuki-nakamachi, Nara, Nara Prefecture, 630-8215, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Newly open izakaya in Naramachi with regional food, more than 70 different dishes!",
  user: User.first
)

# nara3 = URI.open("")
# nara3.photo.attach(io: imgnine, filename: "photo")


nara4 = Shop.create(
  name: "HEX HIVE",
  address: "Minamiichicho, Nara, 630-8373",
  category: "Shop",
  category_icon: "baiten",
  description: "Second hand articles",
  user: User.first
)

# nara4 = URI.open("")
# nara4.photo.attach(io: imgnine, filename: "photo")


nara5 = Shop.create(
  name: "Oshaberi na kame",
  address: "28 Higashimuki Minamimachi, Nara, 630-8216",
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


rally1_count = 10
n = 10

until rally1_count == 15
  ShopParticipant.create(
    shop: Shop.all[rally1_count],
    address: Shop.all[rally1_count].address,
    stamp_rally: StampRally.last,
    qr_code: "#{n}/stamped"
  )
  rally1_count += 1
  n += 1
end

puts "Created participants for stamp rally with id 1"

puts "Finished!"


puts "Created participants for stamp rally with id 3"
puts "Created data for Shioya Shops"


# NAKASATSUNAI
puts "3. Seeding 7 shops for Nakasatsunai-mura..."

naka1 = Shop.create(
  name: "Tokachino Fromages",
  address: "〒089-1330 北海道河西郡中札内村大通南７丁目",
  category: "Shop",
  category_icon: "baiten",
  description: "Enjoy delicious ice cream made with Hokkaido dairy",
  user: User.first
)

# naka1 = URI.open("")
# naka1.photo.attach(io: imgnine, filename: "photo")


naka2 = Shop.create(
  name: "鳥ふじ",
  address:"〒089-1330 北海道河西郡中札内村大通南４丁目５０",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "We are known for our delicious fried chicken - made from locally farm-raised chickens",
  user: User.first
)

# naka2 = URI.open("")
# naka2.photo.attach(io: imgnine, filename: "photo")


naka3 = Shop.create(
  name: "かぜのなかにわ",
  address: "〒089-1330 北海道河西郡中札内村大通南３丁目42",
  category: "Restaurant",
  category_icon: "resutorant",
  description: "The best soba restaurant in town.",
  user: User.first
)

# naka3 = URI.open("")
# naka3.photo.attach(io: imgnine, filename: "photo")


naka4 = Shop.create(
  name: "レストラン チュプ",
  address: "〒089-1330 北海道河西郡中札内村大通南１丁目17−１７ レストラン・チュプ 2F",
  category: "Karaoke",
  category_icon: "karaoke",
  description: "Enjoy an evening of snacks, bottomless drinks, and endless karaoke.",
  user: User.first
)

# naka4 = URI.open("")
# naka4.photo.attach(io: imgnine, filename: "photo")


naka5 = Shop.create(
  name: "六 cafe",
  address: "〒089-1313 北海道河西郡中札内村中札内２４９−６",
  category: "Shop",
  category_icon: "shop",
  description: "Treat yourself to one of our freshly made sweets after touring the neighboring Rokka Forest",
  user: User.first
)

# naka5 = URI.open("")
# naka5.photo.attach(io: imgnine, filename: "photo")


naka6 = Shop.create(
  name: "トカプコーヒー",
  address: "〒089-1330 北海道河西郡中札内村大通南６丁目１３−１",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Have a fresh cup of coffee and enjoy a little treat at this one of a kind coffee shop.",
  user: User.first
)

# naka6 = URI.open("")
# naka6.photo.attach(io: imgnine, filename: "photo")


naka7 = Shop.create(
  name: "ハレノヒ珈琲店",
  address: "〒089-1322 北海道中札内村東２条北７丁目１８",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Owned and operated by a self-proclaimed coffee lover - this coffee shop offers a unique selection of coffee.",
  user: User.first
)

# naka6 = URI.open("")
# naka6.photo.attach(io: imgnine, filename: "photo")

puts "Generated 7 shops for Nakasatsunai-mura"

puts "Creating stamp rallies in Nakasatsunai-mura"

StampRally.create(
  name: "Nakasatsuani Winter Wonderland Rally 2022",
  description: "Come checkout the amazing snow sculptures at our winter wonderland! Be sure to enjoy our famous kareage and try the many delicious treats made with Hokkaido dairy",
  start_date: "2022-1-10",
  end_date: "2022-2-28",
  user: User.first,
  location: User.first.location
)

StampRally.create(
  name: "Nakasatsunai Spring Art Rally 2023",
  description: "This rally is full of hidden art gems - all of which can be found in the greater Nakasatsunai area.",
  start_date: "2023-2-21",
  end_date: "2023-5-31",
  user: User.first,
  location: User.first.location
)

StampRally.create(
  name: "Nakasatsunai Dairy-Lovers Rally 2023",
  description: "This rally is full of hidden art gems - all of which can be found in the greater Nakasatsunai area.",
  start_date: "2023-6-22",
  end_date: "2023-8-22",
  user: User.first,
  location: User.first.location
)

puts "Created stamp rallies in Nakasatsunai"

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants..."

# NAKASATSUANI RALLY ID:1
rally1_count = 16
n = 16

until rally1_count == 22
  ShopParticipant.create(
    shop: Shop.all[rally1_count],
    address: Shop.all[rally1_count].address,
    stamp_rally: StampRally.last,
    qr_code: "#{n}/stamped"
  )
  rally1_count += 1
  n += 1
end

puts "Created participants for stamp rally with id 1"

puts "Finished!"
