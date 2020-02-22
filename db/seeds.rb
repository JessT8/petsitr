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
          picture: FFaker::Image.url(size = '300x300', format = 'png', bg_color = :random, text_color = :random, text = nil),
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a venenatis dolor. Donec eleifend, nisl non ultrices pulvinar, mi sapien accumsan nisl, non suscipit risus metus nec leo. Ut vitae dictum sapien, sit amet porttitor mauris. Nam vel luctus libero. Vestibulum eleifend ante neque, non vehicula est faucibus et. Ut mattis ac enim non egestas. Suspendisse auctor vitae diam a dapibus. Sed ultrices nec erat vel consequat. Integer a eros nec mi vestibulum fermentum. Nunc non mauris et orci cursus commodo sit amet sit amet urna. Cras sagittis faucibus leo, sed vulputate magna interdum auctor.

          Quisque eu ligula ante. Vivamus viverra mollis rhoncus. In sit amet ornare nibh, et mollis sem. Donec aliquam cursus accumsan. In rhoncus imperdiet tempus. Suspendisse sit amet laoreet orci, sit amet lacinia ex. Nulla ac nisl quis ligula mollis accumsan nec ut velit.

          Donec fermentum facilisis lectus, non dictum ante. Duis semper augue lacinia, mollis felis eget, finibus est. Ut ornare tincidunt"
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
          available_end_date:Date.today + 3
        )
Booking.create(
  user: user,
  sitter: new_pet_sitter,
  start_date: Date.today + 1 ,
  end_date:Date.today + 3
  )