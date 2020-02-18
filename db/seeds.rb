# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

user = User.create(:email=>'admin@email.com', :password=>"password123", :username=>'admin');

10.times do
 User.create(
        username: FFaker::Internet.user_name,
        email: FFaker::Internet.email,
        password: 'password123',
      )
end