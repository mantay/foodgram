namespace :db do 
  desc "Fill database with simple data"
  task populate: :environment do 
    User.create!(username: "Example user",
                 email: "exm@mail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@mail.com"
      password = "foobar"
      User.create!(username: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
