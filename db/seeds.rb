# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: "Example User", email: "example@mail.org", admin: true)

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'Ruby on Rails' }
])

tests = Test.create!([
  { title: 'Arrays', level: 0, category_id: categories[0].id, author_id: user.id },
  {title: 'Hashes', level: 1, category_id: categories[0].id, author_id: user.id },
  {title: 'Controller', level: 2, category_id: categories[1].id, author_id: user.id }
])

questions = Question.create!([
  { body: 'What method removes all nil elements from the array?', test_id: tests[0].id },
  { body: 'What method returns true if any element satisfies a given criterion?', test_id: tests[1].id},
  { body: 'From what class inherits all new generated controllers?', test_id: tests[2].id }
])

answers = Answer.create!([
{ body: 'compact', correct: true, question_id: questions[0].id},
{ body: 'any?', correct: true, question_id: questions[1].id },
{ body: 'ActionController', correct: true, question_id: questions[2].id}
])
