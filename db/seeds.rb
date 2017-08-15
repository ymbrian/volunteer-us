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
User.create(first_name: "Roy5678",
            last_name: "Rao",
            email: "roy@gmail.com",
            password: "admin1234",
            is_organizer: true)


User.create(first_name: "Dan12345",
            last_name: "Hao",
            email: "dan@gmail.com",
            password: "admin1234",
            is_organizer: true)

# Create volunteers
20.times do
  first_name = Faker::Name.first_name
  User.create(first_name: first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.free_email(first_name),
              password: "abcd1234")
end

# Create events
CATEGORY = ["startup", "healthcare", "education", "sports"]

EVENTS = [
  {
    title: "Startup Grind",
    date: Time.new(2017,8,20,18,0),
    location: "Chengdu",
    category: "startup",
    user: User.find(1)
  },

  {
    title: "Fuck Up Night",
    date: Time.new(2017,8,23,17,0),
    location: "Chengdu",
    category: "startup",
    user: User.find(1)
  },

  {
    title: "Teaching high school students English",
    date: Time.new(2017,9,1,9,0),
    location: "Chongqing",
    category: "education",
    user: User.find(2)
  },

  {
    title: "Elderly visit",
    date: Time.new(2017,9,20,9,0),
    location: "Hong Kong",
    category: "healthcare",
    user: User.find(3)
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




