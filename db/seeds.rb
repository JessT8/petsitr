# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'ffaker'

dog  = Pet.create(
    animal: 'dog'
)
 Pet.create(
    animal: 'cat'
)
 Pet.create(
    animal: 'bird'
)

user = User.create(:email=>'admin@email.com', :password=>"password123", :username=>'admin');

10.times do
 sitter = User.create(
        username: FFaker::Internet.user_name,
        email: FFaker::Internet.email,
        password: 'password123',
      )
   pet_sitter = Sitter.create(
          user: sitter,
          phone: FFaker::PhoneNumberSG.phone_number,
          price: '40',
          is_visible: true,
          picture: FFaker::Image.url(size = '300x300', format = 'png', bg_color = :random, text_color = :random, text = nil)
        )
      pet_sitter.pets << dog
    Timeslot.create(
          sitter: pet_sitter,
          available_start_date: Date.today + 1 ,
          available_end_date:Date.today + 5
        )
end
 new_user = User.create(
        username: FFaker::Internet.user_name,
        email: FFaker::Internet.email,
        password: 'password123',
      )

   new_pet_sitter = Sitter.create(
          user: new_user,
          phone: FFaker::PhoneNumberSG.phone_number,
          price: '40',
          is_visible: true,
          picture: FFaker::Image.url(size = '300x300', format = 'png', bg_color = :random, text_color = :random, text = nil)
        )
    new_pet_sitter.pets << dog
    timeslot = Timeslot.create(
          sitter: new_pet_sitter,
          available_start_date: Date.today + 1 ,
          available_end_date:Date.today + 5
        )
Booking.create(
  user: user,
  sitter: new_pet_sitter,
  start_date: Date.today + 1 ,
  end_date:Date.today + 5
  )