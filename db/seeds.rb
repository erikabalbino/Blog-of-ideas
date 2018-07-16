# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Idea.delete_all

50.times do  
    i = Idea.create(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph(2, true)
    )
    if i.valid?
        rand(0..5).times do
            Review.create(
                body: Faker::Matz.quote,
                idea: i
            )
        end
    end
end

ideas = Idea.all
reviews = Review.all

puts Cowsay.say "Created #{ideas.count} ideas", :tux
puts Cowsay.say "Created #{reviews.count} reviews", :cow