require "faker"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.production?
  url = "https://www.sampompom.team"
elsif Rails.env.development?
  url = "http://localhost:3000"
end

puts "cleaning database..."
Shop.destroy_all
User.destroy_all

puts "Cleaned the Database of previous seeds.. RESETTING everything.."

###########################################

puts "0. Creating users..."

User.create(
  [
    { email: "maria@example.com",
      name: "Maria",
      password: "123456",
      status: 0,
      location: "Higashimuki-nakamachi, Nara, Nara Prefecture, 630-8215, Japan" },

    { email: "mmak@example.com",
      name: "Mariama",
      password: "123456",
      status: 0,
      location: "Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaidō Prefecture, 089-1353, Japan" },

    { email: "jun@example.com",
      name: "Junsuke",
      password: "123456",
      status: 1,
      street_name: "Shioya Street",
      location: "Tarumi Ward, Kobe, Hyōgo Prefecture, Japan" },

    { email: "jay@example.com",
      name: "Jeremy",
      password: "123456",
      status: 0,
      location: "yanomaru aki shi kochi japan" },

    { email: "ultraman@chairperson.com",
      name: "Yuuichiro",
      password: "123456",
      status: 1,
      location: "Kinuta 1-chome, Setagaya, Tokio, 157-8510, Japan" },

    { email: "kibukawa@chairperson.com",
      name: "Takebata",
      password: "123456",
      status: 1,
      location: "Mushono, Koka, Shiga, japan" }
  ]
)

puts "Created the amazing users"

############################################
############################################
############################################
############################################
############################################

puts ".......... New Shoutengai"

############################################

# SHIOYA STREET
puts "1. Seeding 9 shops for Shioya Street..."

shopone = Shop.create(
  name: "Shirochan",
  address: "Shioyacho 3-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0861, Japan",
  category: "Teishoku",
  category_icon: "misoshiru",
  description: "Umai Yasui Teishoku",
  user: User.find(id = 3)
)
imgone = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/Shirochan_ii75ig.jpg")
shopone.photo.attach(io: imgone, filename: "photo")

shoptwo = Shop.create(
  name: "Micchan",
  address: "Shioyacho 4-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Umai Yasui Yakitori",
  user: User.find(id = 3)
)
imgtwo = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676893777/micchan_is6e6v.jpg")
shoptwo.photo.attach(io: imgtwo, filename: "photo")

shopthree = Shop.create(
  name: "Pizza Akiratsch",
  address: "Shioyacho 6-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Umai Yasui Pizza",
  user: User.find(id = 3)
)
imgthree = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/pizzaakiratsch_h4vpsb.jpg")
shopthree.photo.attach(io: imgthree, filename: "photo")

shopfour = Shop.create(
  name: "Miki",
  address: "3-6-28 Shioyacho, Tarumi Ward, Kobe, Hyogo 655-0872",
  category: "Okonomiyaki",
  category_icon: "okonomiyaki",
  description: "Umai Yasui Okonomiyaki",
  user: User.find(id = 3)
)
imgfour = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/miki_jrakqj.jpg")
shopfour.photo.attach(io: imgfour, filename: "photo")

shopfive = Shop.create(
  name: "Ryu Cafe",
  address: "3-8-4 Shioyacho, Tarumi Ward, Kobe, Hyogo 655-0872",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Umai Yasui Taiwanese",
  user: User.find(id = 3)
)
imgfive = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/ryucafe_bjutdy.jpg")
shopfive.photo.attach(io: imgfive, filename: "photo")

shopsix = Shop.create(
  name: "Tokonatsu",
  address: "Shioyacho 7-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Umai Yasui Izakaya",
  user: User.find(id = 3)
)
imgsix = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676689092/Tokonatsu_hmrrtv.jpg")
shopsix.photo.attach(io: imgsix, filename: "photo")

shopseven = Shop.create(
  name: "Hair Works Cool",
  address: "Shioyacho 8-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Hair salon",
  category_icon: "biyoshitsu",
  description: "Umai Yasui barber",
  user: User.find(id = 3)
)
imgseven = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676546056/hairworkscool_n6pd3v.jpg")
shopseven.photo.attach(io: imgseven, filename: "photo")

shopeight = Shop.create(
  name: "Wanda Curry",
  address: "Shioyacho 1-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0861, Japan",
  category: "Curry",
  category_icon: "kare-raisu",
  description: "Umai Yasui curry",
  user: User.find(id = 3)
)
imgeight = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/wandacurry_i8419z.jpg")
shopeight.photo.attach(io: imgeight, filename: "photo")

shopnine = Shop.create(
  name: "Mini-tomato",
  address: "Shioyacho 5-chome, Tarumi Ward, Kobe, Hyōgo Prefecture, 655-0852, Japan",
  category: "Shop",
  category_icon: "baiten",
  description: "Umai Yasui grocer",
  user: User.find(id = 3)
)
imgnine = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1676548462/minitomate_wl1xln.jpg")
shopnine.photo.attach(io: imgnine, filename: "photo")

puts "Generated 9 shops for Shioya Street"

############################################

puts "Creating stamp rallies in Shioya"

# stamp rally 1
StampRally.create(
  name: "Shioya Stamp Rally spring 2023",
  description: "Celebrate the arrival of spring at Shioya Street!",
  start_date: "2023-02-01",
  end_date: "2023-03-20",
  user: User.find(id = 3),
  location: User.find(id = 3).location,
  reward: "sticker"
)

# stamp rally 2
StampRally.create(
  name: "Shioya Stamp Rally summer 2023",
  description: "Enjoy fireworks with the best food of Shioya Street",
  start_date: "2023-06-01",
  end_date: "2023-06-20",
  user: User.find(id = 3),
  location: User.find(id = 3).location,
  reward: "badge"
)

puts "Created stamp rallies in Shioya Area"
############################################

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants for Shioya Area"

# the number of shops in SHIOYA => 9 (index: 0 - 8)
# SHIOYA RALLY #1
rally1_count = 0
n = 1
until rally1_count == 7
  ShopParticipant.create(
    shop: Shop.all[rally1_count],
    address: Shop.all[rally1_count].address,
    stamp_rally: StampRally.find(id = 1),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally1_count += 1
  n += 1
end

# SHIOYA RALLY #2
rally2_count = 0
until rally2_count == 9
  ShopParticipant.create(
    shop: Shop.all[rally2_count],
    address: Shop.all[rally2_count].address,
    stamp_rally: StampRally.find(id = 2),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally2_count += 1
  n += 1
end

puts "Created shop participants for Shioya Area"

puts "Finished!"

############################################
############################################
############################################
############################################
############################################

# NARAMACHI STREET
puts ".......... New Shoutengai"

puts "2. Seeding 6 shops for Naramachi..."

nara1 = Shop.create(
  name: "Fuku Roku Dou",
  address: "27 Kamisanjocho, Nara, 630-8228",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Castella shop",
  user: User.find(id = 1)
)
nara1img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677311980/fukurokudou_tywodz.jpg")
nara1.photo.attach(io: nara1img, filename: "photo")

nara2 = Shop.create(
  name: "Cafe FLUKE",
  address: "10 Higashimuki Nakamachi, Nara, 630-8215",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Retro coffee in Naramachi",
  user: User.find(id = 1)
)
nara2img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677311980/cafefluke_ythhsc.jpg")
nara2.photo.attach(io: nara2img, filename: "photo")

nara3 = Shop.create(
  name: "奈良ism",
  address: "Kintetsu Nara, 行基広場, Higashimuki-nakamachi, Nara, Nara Prefecture, 630-8215, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Newly open izakaya in Naramachi with regional food, more than 70 different dishes!",
  user: User.find(id = 1)
)
nara3img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677311980/naraism_w4cqac.jpg")
nara3.photo.attach(io: nara3img, filename: "photo")

nara4 = Shop.create(
  name: "HEX HIVE",
  address: "Minamiichicho, Nara, 630-8373",
  category: "Shop",
  category_icon: "baiten",
  description: "Second hand articles",
  user: User.find(id = 1)
)
nara4img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677311980/hexhive_vhjxxi.jpg")
nara4.photo.attach(io: nara4img, filename: "photo")

nara5 = Shop.create(
  name: "Oshaberi na kame",
  address: "28 Higashimuki Minamimachi, Nara, 630-8216",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Retro coffee shop with very yummy omurice",
  user: User.find(id = 1)
)
nara5img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677311980/oshaberinakame_qtpgdx.jpg")
nara5.photo.attach(io: nara5img, filename: "photo")

nara6 = Shop.create(
  name: "Ramen K",
  address: "9 Komyoincho, Nara, 630-8371",
  category: "Ramen",
  category_icon: "ramen",
  description: "Speciality ramen",
  user: User.find(id = 1)
)
nara6img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677311980/ramenk_ko0mfy.jpg")
nara6.photo.attach(io: nara6img, filename: "photo")

puts "Generated 6 shops for Naramachi"
############################################
puts "Creating stamp rallies in Naramachi"

StampRally.create(
  name: "Naramachi deer festival",
  description: "Shops reunited to get donations for deer association",
  start_date: "2023-2-10",
  end_date: "2023-3-20",
  user: User.find(id = 1),
  location: User.find(id = 1).location,
  reward: "keyholder"
)

puts "Created stamp rallies in Naramachi"
############################################

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants for Naramachi"

# the number of shops in NARA => 6 (index: 9 - 14 )
# NARALLY #3
rally3_count = 9
until rally3_count == 15
  ShopParticipant.create(
    shop: Shop.all[rally3_count],
    address: Shop.all[rally3_count].address,
    stamp_rally: StampRally.find(id = 3),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally3_count += 1
  n += 1
end

puts "Created shop participants for Naramachi"

puts "Finished!"

############################################
############################################
############################################
############################################
############################################

puts ".......... New Shoutengai"
############################################

# NAKASATSUNAI
puts "3. Seeding 7 shops for Nakasatsunai-mura..."

naka1 = Shop.create(
  name: "Tokachino Fromages",
  address: "大通南二丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture",
  category: "Shop",
  category_icon: "baiten",
  description: "Enjoy delicious ice cream made with Hokkaido dairy",
  user: User.find(id = 2)
)
naka1img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312286/sweet_shop_sweets_hsmcnr.png")
naka1.photo.attach(io: naka1img, filename: "photo")

naka2 = Shop.create(
  name: "Shima Fuji",
  address: "大通北六丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture, 089-1353, Japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "We are known for our delicious fried chicken - made from locally farm-raised chickens",
  user: User.find(id = 2)
)
naka2img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312285/kareage_shop_alcjd5.png")
naka2.photo.attach(io: naka2img, filename: "photo")

naka3 = Shop.create(
  name: "かぜのなかにわ",
  address: "大通北七丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture, 089-1353, Japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "The best soba restaurant in town.",
  user: User.find(id = 2)
)
naka3img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312286/soba_restaurant_n8m5ib.png")
naka3.photo.attach(io: naka3img, filename: "photo")

naka4 = Shop.create(
  name: "レストラン チュプ",
  address: "大通南三丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture, 089-1353, Japan",
  category: "Karaoke",
  category_icon: "karaoke",
  description: "Enjoy an evening of snacks, bottomless drinks, and endless karaoke.",
  user: User.find(id = 2)
)
naka4img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312285/karaoke_shop_dfaxac.png")
naka4.photo.attach(io: naka4img, filename: "photo")

naka5 = Shop.create(
  name: "六cafe",
  address: "大通南一丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture, 089-1353, Japan",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Treat yourself to one of our freshly made sweets after touring the neighboring Rokka Forest",
  user: User.find(id = 2)
)
naka5img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312285/sweet_shop_mainE_wbmtuw.png")
naka5.photo.attach(io: naka5img, filename: "photo")

naka6 = Shop.create(
  name: "トカプコーヒー",
  address: "大通南六丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture, 089-1353, Japan",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Have a fresh cup of coffee and enjoy a little treat at this one of a kind coffee shop.",
  user: User.find(id = 2)
)
naka6img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312285/coffee_shop_cg7dsd.png")
naka6.photo.attach(io: naka6img, filename: "photo")

naka7 = Shop.create(
  name: "ハレノヒ珈琲店",
  address: "大通南七丁目, Nakasatsunai, Kasai County, Tokachi Subprefecture, Hokkaido Prefecture, 089-1353, Japan",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Owned and operated by a self-proclaimed coffee lover - this coffee shop offers a unique selection of coffee.",
  user: User.find(id = 2)
)
naka7img = URI.open("https://res.cloudinary.com/diohufzdn/image/upload/v1677312285/harenohi_coffee_shop_emk6fk.png")
naka7.photo.attach(io: naka7img, filename: "photo")

puts "Generated 7 shops for Nakasatsunai-mura"
############################################

puts "Creating stamp rallies in Nakasatsunai-mura"

StampRally.create(
  name: "Nakasatsunai Spring Art Rally 2023",
  description: "This rally is full of hidden art gems - all of which can be found in the greater Nakasatsunai area.",
  start_date: "2023-2-21",
  end_date: "2023-5-31",
  user: User.find(id = 2),
  location: User.find(id = 2).location,
  reward: "stationary"
)

StampRally.create(
  name: "Nakasatsunai Dairy-Lovers Rally 2023",
  description: "This rally is full of hidden art gems - all of which can be found in the greater Nakasatsunai area.",
  start_date: "2023-6-22",
  end_date: "2023-7-9",
  user: User.find(id = 2),
  location: User.find(id = 2).location,
  reward: "keyholder"
)

puts "Created stamp rallies in Nakasatsunai"
############################################

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants for Nakasatsunai"

# the number of shops in Nakasatsunai => 7 (index: 15 - 21 )
# NAKASATSUANI RALLY #4
rally4_count = 15
until rally4_count == 21
  ShopParticipant.create(
    shop: Shop.all[rally4_count],
    address: Shop.all[rally4_count].address,
    stamp_rally: StampRally.find(id = 4),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally4_count += 1
  n += 1
end

# NAKASATSUANI RALLY #5
rally5_count = 15
until rally5_count == 21
  ShopParticipant.create(
    shop: Shop.all[rally5_count],
    address: Shop.all[rally5_count].address,
    stamp_rally: StampRally.find(id = 5),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally5_count += 1
  n += 1
end

puts "Created shop participants for Nakasatsunai"

puts "Finished!"

############################################
############################################
############################################
############################################
############################################

puts ".......... New Shoutengai"

############################################

# SETAGAYA ULTRAMAN STREET
puts "4. Seeding 6 shops for Ultraman Shopping Street..."

ultraman1 = Shop.create(
  name: "Unatetsu",
  address: "Kinuta 1-chome, Setagaya, Tokio, 157-8510, Japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Enjoy delicious unagi",
  user: User.find(id = 5)
)
# ultraman1img = URI.open("")
# ultraman1.photo.attach(io: ultraman1img, filename: "photo")

ultraman2 = Shop.create(
  name: "Shinkyo",
  address: "Kinuta 2-chome, Setagaya, Tokio, 157-8510, Japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Enjoy delicious unagi",
  user: User.find(id = 5)
)
# ultraman2img = URI.open("")
# ultraman2.photo.attach(io: ultraman2img, filename: "photo")

ultraman3 = Shop.create(
  name: "Tohachi",
  address: "Kinuta 3-chome, Setagaya, Tokio, 157-8510, Japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Enjoy delicious unagi",
  user: User.find(id = 5)
)
# ultraman3img = URI.open("")
# ultraman3.photo.attach(io: ultraman3img, filename: "photo")

Shop.create(
  name: "Curry Nankai",
  address: "Kinuta 4-chome, Setagaya, Tokio, 157-8510, Japan",
  category: "Curry",
  category_icon: "kare-raisu",
  description: "Enjoy delicious unagi",
  user: User.find(id = 5)
)
# ultraman4img = URI.open("")
# ultraman4.photo.attach(io: ultraman4img, filename: "photo")

Shop.create(
  name: "Kinashi Cycle",
  address: "Kinuta 5-chome, Setagaya, Tokio, 157-8510, Japan",
  category: "Shop",
  category_icon: "baiten",
  description: "Enjoy delicious unagi",
  user: User.find(id = 5)
)
# ultraman5img = URI.open("")
# ultraman5.photo.attach(io: ultraman5img, filename: "photo")

Shop.create(
  name: "Low Key Tone",
  address: "Kinuta 6-chome, Setagaya, Tokio, 157-8510, Japan",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Enjoy delicious unagi",
  user: User.find(id = 5)
)
# ultraman6img = URI.open("")
# ultraman6.photo.attach(io: ultraman6img, filename: "photo")

puts "Generated 6 shops for Ultraman Shopping Street"
############################################

puts "Creating stamp rallies in Ultraman Shopping Street"

StampRally.create(
  name: "Ultraman anime festa 2023",
  description: "For the nostalgic anime lovers",
  start_date: "2023-3-9",
  end_date: "2023-3-16",
  user: User.find(id = 5),
  location: User.find(id = 5).location,
  reward: "stationary"
)

StampRally.create(
  name: "Flavorus of the past in Setagaya",
  description: "Enjoy traditional cousine",
  start_date: "2023-5-10",
  end_date: "2023-5-30",
  user: User.find(id = 5),
  location: User.find(id = 5).location,
  reward: "towel"
)

puts "Created stamp rallies in Ultraman Shopping Street"

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants for Ultraman Shopping Street"

# the number of shops in Ultraman street => 6 (index: 23 - 28 )
# ULTRAMAN STREET RALLY #6
rally6_count = 22
until rally6_count >= 28
  ShopParticipant.create(
    shop: Shop.all[rally6_count],
    address: Shop.all[rally6_count].address,
    stamp_rally: StampRally.find(id = 6),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally6_count += 1
  n += 1
end

# ULTRAMAN STREET RALLY #7
rally7_count = 23
until rally7_count >= 28
  ShopParticipant.create(
    shop: Shop.all[rally7_count],
    address: Shop.all[rally7_count].address,
    stamp_rally: StampRally.find(id = 7),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally7_count += 1
  n += 1
end

puts "Created shop participants for Ultraman Shopping Street"

puts "Finished!"

############################################

puts ".......... New Shoutengai"

############################################

# Kibukawa
puts "5. Seeding 6 shops for Kibukawa Street..."

kibukawa1 = Shop.create(
  name: "UOnagiii",
  address: "1 kibukawa koka shiga japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Enjoy delicious unagi",
  user: User.find(id = 6)
)
# kibukawa1img = URI.open("")
# kibukawa1.photo.attach(io: kibukawa1img, filename: "photo")

kibukawa2 = Shop.create(
  name: "BAKAKA",
  address: "2 kibukawa koka shiga japan",
  category: "Restaurant",
  category_icon: "resutoran",
  description: "Enjoy delicious unagi",
  user: User.find(id = 6)
)
# kibukawa2img = URI.open("")
# kibukawa2.photo.attach(io: kibukawa2img, filename: "photo")

kibukawa3 = Shop.create(
  name: "Majidekka",
  address: "3 kibukawa koka shiga japan",
  category: "Izakaya",
  category_icon: "izakaya",
  description: "Enjoy delicious unagi",
  user: User.find(id = 6)
)
# kibukawa3img = URI.open("")
# kibukawa3.photo.attach(io: kibukawa3img, filename: "photo")

kibukawa4 = Shop.create(
  name: "Nanbaheiba",
  address: "4 kibukawa koka shiga japan",
  category: "Curry",
  category_icon: "kare-raisu",
  description: "Enjoy delicious unagi",
  user: User.find(id = 6)
)
# kibukawa4img = URI.open("")
# kibukawa4.photo.attach(io: kibukawa4img, filename: "photo")

kibukawa5 = Shop.create(
  name: "Ago",
  address: "46 kibukawa koka shiga japan",
  category: "Shop",
  category_icon: "baiten",
  description: "Enjoy delicious unagi",
  user: User.find(id = 6)
)
# kibukawa5img = URI.open("")
# kibukawa5.photo.attach(io: kibukawa5img, filename: "photo")

kibukawa6 = Shop.create(
  name: "Hecchara Coffee",
  address: "5 kibukawa koka shiga japan",
  category: "Coffee",
  category_icon: "kissaten",
  description: "Enjoy delicious unagi",
  user: User.find(id = 6)
)
# kibukawa6img = URI.open("")
# kibukawa6.photo.attach(io: kibukawa6img, filename: "photo")

puts "Generated 6 shops for Kibukawa Street"

############################################

puts "Creating stamp rallies in Kibukawa Street"

StampRally.create(
  name: "Kibukawa Kids Festival 2023",
  description: "Come Celebrate with Kibukawa Kids and their new school year",
  start_date: "2023-3-31",
  end_date: "2023-4-17",
  user: User.find(id = 6),
  location: User.find(id = 6).location,
  reward: "stationary"
)

StampRally.create(
  name: "The beauty of Miho and Art in Koka",
  description: "Koka city Kibukawa, a million adventures and art in every direction. Enjoy the rain and beautiful flowers with art",
  start_date: "2023-6-17",
  end_date: "2023-6-30",
  user: User.find(id = 6),
  location: User.find(id = 6).location,
  reward: "towel"
)

puts "Created stamp rallies in Kibukawa Shopping Street"

# CREATE SHOP PARTICIPANTS FOR EXISTING RALLIES:
puts "Creating shop participants for Kibukawa Shopping Street"

# the number of shops in Kibukawa street => 6 (index: 29 - 35 )
# Kibukawa STREET RALLY #8
rally8_count = 29
until rally8_count >= 34
  ShopParticipant.create(
    shop: Shop.all[rally8_count],
    address: Shop.all[rally8_count].address,
    stamp_rally: StampRally.find(id = 8),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally8_count += 1
  n += 1
end

# kibukawa STREET RALLY #9
rally9_count = 29
until rally9_count >= 34
  ShopParticipant.create(
    shop: Shop.all[rally9_count],
    address: Shop.all[rally9_count].address,
    stamp_rally: StampRally.find(id = 9),
    qr_code: "#{url}/shop_participants/#{n}/stamped"
  )
  rally9_count += 1
  n += 1
end

puts "Created shop participants for Kibukawa"

puts "Finished!"

puts "Seeds completed"
