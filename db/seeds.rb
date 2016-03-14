# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  5.times do
    Author.create(password: "monkey", email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end

  10.times do |f|
    Survey.create(title: Faker::Hipster.sentence, description: Faker::Hipster.paragraph, token: nil, author_id: f % 5 + 1)
    Survey.create(title: Faker::Hipster.sentence, description: Faker::Hipster.paragraph, token: SecureRandom.urlsafe_base64, author_id: f % 5 + 1)
  end

  50.times do |i|
    Question.create(question_type_id: 1, survey_id: i % 10 + 1, question_text: Faker::Hacker.say_something_smart, description: Faker::Hipster.paragraph(2), required: rand(2), order: i / 10 * 3 + 1)
    Question.create(question_type_id: 2, survey_id: i % 10 + 1, question_text: Faker::Hacker.say_something_smart, description: Faker::Hipster.paragraph(2), required: rand(2), order: i / 10 * 3 + 2)
    Question.create(question_type_id: 3, survey_id: i % 10 + 1, question_text: Faker::Hacker.say_something_smart, description: Faker::Hipster.paragraph(2), required: rand(2), order: i / 10 * 3 + 3)
    Option.create(question_id: (i + 1) * 3, option: Faker::Book.title, value: Faker::Book.genre)
    Option.create(question_id: (i + 1) * 3, option: Faker::Book.title, value: Faker::Book.genre)
  end

  5.times do |a|
    Answer.create(question_id: (a * 30 +4), answer: Faker::Hacker.say_something_smart, taker_id: rand(1..10))
    Answer.create(question_id: (a * 30 +5), answer: Faker::Hacker.say_something_smart, taker_id: rand(1..10))
    Answer.create(question_id: (a * 30 +6), answer: Faker::Hacker.say_something_smart, taker_id: rand(1..10))
  end
end




QuestionType.create(category: "Short")
QuestionType.create(category: "Long")
QuestionType.create(category: "Radio")
QuestionType.create(category: "DropDown")
