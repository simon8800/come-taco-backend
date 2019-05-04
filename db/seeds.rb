# frozen_string_literal: true

User.destroy_all
Item.destroy_all

10.times do
  User.create(
    "first_name": Faker::Name.first_name,
    "last_name": Faker::Name.last_name,
    "email": Faker::Internet.email,
    "password": Faker::Internet.password(8)
  )
end
