# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
User.destroy_all
Booking.destroy_all

# Create organizers
User.create(first_name: "Roy",
            last_name: "Rao",
            email: "roy@gmail.com",
            password: "admin1234",
            is_organizer: true,
            confirmed_at: Time.now)


User.create(first_name: "Dan12345",
            last_name: "Hao",
            email: "dan@gmail.com",
            password: "admin1234",
            is_organizer: true,
            confirmed_at: Time.now)

# Create volunteers
20.times do
  first_name = Faker::Name.first_name
  User.create(first_name: first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.free_email(first_name),
              password: "abcd1234",
              confirmed_at: Time.now)
end

# Create events
CATEGORY = ["startup", "healthcare", "education", "sports"]

EVENTS = [
  {
    title: "Startup Grind",
    date: Time.new(2017,8,20,18,0),
    location: "Chengdu",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/139976/pexels-photo-139976.jpeg"
  },

  {
    title: "Fuck Up Night",
    date: Time.new(2017,8,23,17,0),
    location: "中国四川省成都市武侯区天府三街88號",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/4516/sky-people-clouds-crowd.jpg"
  },

  {
    title: "Teaching English",
    date: Time.new(2017,9,1,9,0),
    location: "中国四川省成都市武侯区天府五街天府5街",
    category: "education",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/241544/pexels-photo-241544.jpeg"
  },

  {
    title: "Startup Grind 2",
    date: Time.new(2017,9,25,9,0),
    location: "笔帖式街81号",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/7376/startup-photos.jpg"
  },

  {
    title: "Startup Grind 3",
    date: Time.new(2017,9,9,19,30),
    location: "1656 Tianfu Ave North Section, Wuhou Qu, Chengdu Shi, Sichuan Sheng, China",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/450271/pexels-photo-450271.jpeg"
  },

  {
    title: "Startup Grind 4",
    date: Time.new(2017,9,25,20,0),
    location: "9 Binjiang Middle Rd, Jinjiang Qu, Chengdu Shi, Sichuan Sheng, China, 610020",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/7376/startup-photos.jpg"
  },

  {
    title: "Fuck Up Night 5",
    date: Time.new(2017,10,20,18,0),
    location: "桐梓林东路12号",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/7376/startup-photos.jpg"
  },

  {
    title: "Fuck Up Night 6",
    date: Time.new(2017,10,28,18,30),
    location: "1附21 Binjiang Middle Rd, Jinjiang Qu, Chengdu Shi, Sichuan Sheng, China, 610000",
    category: "startup",
    user: User.first,
    poster_url: "https://static.pexels.com/photos/7376/startup-photos.jpg"
  },
]

Event.create!(EVENTS)

# Create bookings
30.times do
  rand_user = User.where("is_organizer = false").sample
  rand_event = Event.all.sample
  @booking = Booking.new(user: rand_user, event: rand_event)
  if @booking.save
  else
    puts "#{rand_user.first_name} is already registered for #{rand_event.title}"
  end
end




