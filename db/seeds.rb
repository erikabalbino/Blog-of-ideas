# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.delete_all

50.times do  
    Idea.create(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph(2, true)
    )
end

ideas = Idea.all

puts Cowsay.say "Created #{ideas.count} ideas", :tux