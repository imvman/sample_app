namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "administrator",
                 email: "admin@163.com",
                 password: "admin1000",
                 password_confirmation: "admin1000",
				 admin: true)
    100.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
	users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end # end of task
end # end of desc