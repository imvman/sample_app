namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
	make_users
	make_microposts
	make_relationships
    end
	def make_users
		admin = User.create!(name: "administrator",
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
	end
	def make_relationships
		users = User.all
		user = users.first
		followed_users = users[2..50]
		followers = users[3..40]
		follewed_users.each do |followed|
			user.follow!(followed)
		end
		followers.each do |follower|
			follower.follow!(user)
		end
	end
			
	def make_microposts
		users = User.all(limit: 6)
		50.times do
		content = Faker::Lorem.sentence(5)
		users.each { |user| user.microposts.create!(content: content) }
		end
	end
end # end of desc