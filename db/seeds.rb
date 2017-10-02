@user = User.create(email: "foo@bar.com",
                    first_name: "Foo",
                    last_name: "Bar",
                    password: "foo@bar",
                    password_confirmation: "foo@bar",
                    phone: "1234567890")

puts "1 user created!"

@user = AdminUser.create(email: "foo1@bar.com",
                         first_name: "Jesse",
                         last_name: "Pinkman",
                         password: "foo1@bar",
                         password_confirmation: "foo1@bar",
                         phone: "1234567890")

puts "1 Adminuser created!"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 posts created"
