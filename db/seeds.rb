# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "secret" 

Review.delete_all
Idea.delete_all
User.delete_all

super_user = User.create(
    first_name: "Erika",
    last_name: "Balbino",
    email: "erika.balbino@example.com",
    password: PASSWORD
)

10.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end

users = User.all

puts Cowsay.say "Created #{users.count} users", :sheep

50.times do  
    i = Idea.create(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph(2, true),
        user: users.sample
    )
    if i.valid?
        rand(0..5).times do
            Review.create(
                body: Faker::Matz.quote,
                idea: i,
                user: users.sample
            )
        end
    end
end

ideas = Idea.all
reviews = Review.all

puts Cowsay.say "Created #{ideas.count} ideas", :tux
puts Cowsay.say "Created #{reviews.count} reviews", :cow
puts 
"Login with #{super_user.email} and password #{PASSWORD}"