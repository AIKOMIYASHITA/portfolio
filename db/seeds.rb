100.times do |n|
  name = Faker::Pokemon.name
  email = Faker::Internet.email
  password = "Test_1213"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end
