# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |f|
  Survey.create(title: Faker::Hipster.sentence, description: Faker::Hipster.paragraph, token: nil, author_id: rand(1..10))
end

20.times do |f|
  Author.create(password: "monkey", email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

QuestionType.create(category: "Short")
QuestionType.create(category: "Long")
QuestionType.create(category: "YesNo")
