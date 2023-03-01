# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  { name: "Admin", email: "example@mail.org", admin: true },
  { name: "Igor", email: "example1@mail.org"},
  { name: "George", email: "example2@mail.org" },
  { name: "Ivan", email: "example3@mail.org"} ])

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'Ruby on Rails' }
])

tests = Test.create!([
  { title: 'Arrays', level: 0, category: categories[0], author: users[0] },
  { title: 'Hashes', level: 1, category: categories[0], author: users[0] },
  { title: 'Controller', level: 2, category: categories[1], author: users[0] },
  { title: 'Model', level: 2, category: categories[1], author: users[0] },
  { title: 'Routing', level: 2, category: categories[1], author: users[0] },
  { title: 'Integers', level: 0, category: categories[0], author: users[0] },
  { title: 'Strings', level: 0, category: categories[0], author: users[0] }
])
=begin
questions = Question.create!([
  { body: 'What method removes all nil elements from the array?', test_id: tests[0].id },
  { body: 'What method returns the first element, or the first n elements, of the array.?', test_id: tests[0].id },
  { body: 'What method returns the number of elements in array?', test_id: tests[0].id },
  { body: 'What method invokes the given block once for each element of array?', test_id: tests[0].id },
  { body: 'What method returns the object in ary with the minimum value?', test_id: tests[0].id },
  { body: 'What method calls the given block with each key-value pair?', test_id: tests[1].id },
  { body: 'What method returns true if there are no hash entries, false otherwise?', test_id: tests[1].id },
  { body: 'What method returns true if any element satisfies a given criterion?', test_id: tests[1].id },
  { body: 'What method returns the count of entries in hash?', test_id: tests[1].id },
  { body: 'From what class inherits all new generated controllers?', test_id: tests[2].id },
  { body: 'what kind of methods are callable as actions?', test_id: tests[2].id }
])

answers = Answer.create!([
{ body: 'compact', correct: true, question_id: questions[0].id },
{ body: 'first()', correct: true, question_id: questions[1].id },
{ body: 'length', correct: true, question_id: questions[2].id },
{ body: 'map', correct: true, question_id: questions[3].id },
{ body: 'min', correct: true, question_id: questions[4].id },
{ body: 'each', correct: true, question_id: questions[5].id },
{ body: 'empty?', correct: true, question_id: questions[6].id },
{ body: 'any?', correct: true, question_id: questions[7].id },
{ body: 'length', correct: true, question_id: questions[8].id },
{ body: 'ActionController', correct: true, question_id: questions[9].id },
{ body: 'public', correct: true, question_id: questions[10].id }
])
=end

results = Result.create!([
{ test: tests[0], user: users[1] },
{ test: tests[1], user: users[1] },
{ test: tests[4], user: users[1] },
{ test: tests[5], user: users[1] },
{ test: tests[6], user: users[1] },
{ test: tests[3], user: users[1] },
{ test: tests[2], user: users[2] }])
