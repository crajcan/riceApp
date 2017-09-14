User.create!(name:  "Example User",
             email: "email@#{APP_NAME}.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now,
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@#{APP_NAME}.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::ChuckNorris.fact
  users.each { |user| user.posts.create!(content: content) }
end

unfollowing = users[3..6]
user = User.first
unfollowing.each { |unfollowed| user.unfollow(unfollowed) }
