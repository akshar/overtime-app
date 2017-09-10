@user = User.create(email: "foo@bar.com", first_name: "Foo", last_name: "Bar", password: "foo@bar", password_confirmation: "foo@bar")

puts "1 user created!"
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 posts created"
