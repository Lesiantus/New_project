# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  { first_name: "Ilya", last_name: "Dobryi", email: "example@mail.org", password: "123123", type: "Admin" },
  { first_name: "Dmitriy", last_name: "Ivanovitch", email: "example1@mail.org", password: "123123" },
  { first_name: "Vasiliy", last_name: "Vasilievitch", email: "example2@mail.org", password: "123123" },
  { first_name: "Georgiy", last_name: "Dobrovitch", email: "example3@mail.org", password: "123123"} ])

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'Ruby on Rails' },
  { title: 'Some cat1' },
  { title: 'Another cat' },
  { title: 'Grumpy cat' }
])

tests = Test.create!([
  { title: 'Arrays', level: 1, category: categories[0], author: users[0] },
  { title: 'Hashes', level: 1, category: categories[0], author: users[0] },
  { title: 'Controller', level: 2, category: categories[1], author: users[0] },
  { title: 'Model', level: 2, category: categories[1], author: users[0] },
  { title: 'Routing', level: 2, category: categories[1], author: users[0] },
  { title: 'Integers', level: 1, category: categories[0], author: users[0] },
  { title: 'Middle test', level: 2, category: categories[0], author: users[0] },
  { title: 'Middle test 2', level: 3, category: categories[0], author: users[0] },
  { title: 'Middle test 3', level: 4, category: categories[0], author: users[0] },
  { title: 'Hard test 1', level: 5, category: categories[0], author: users[0] },
  { title: 'Hard test 2', level: 6, category: categories[0], author: users[0] },
  { title: 'Hard test 3', level: 10, category: categories[0], author: users[0] },
  { title: 'Strings', level: 1, category: categories[0], author: users[0] }
])

questions = Question.create!([
  { body: 'What method removes all nil elements from the array?', test: tests[0] },
  { body: 'What method returns the first element, or the first n elements, of the array.?', test: tests[0] },
  { body: 'What method returns the number of elements in array?', test: tests[0] },
  { body: 'What method invokes the given block once for each element of array?', test: tests[0] },
  { body: 'What method returns the object in ary with the minimum value?', test: tests[0] },
  { body: 'What method calls the given block with each key-value pair?', test: tests[1] },
  { body: 'What method returns true if there are no hash entries, false otherwise?', test: tests[1] },
  { body: 'What method returns true if any element satisfies a given criterion?', test: tests[1] },
  { body: 'What method returns the count of entries in hash?', test_id: tests[1].id },
  { body: 'From what class inherits all new generated controllers?', test: tests[2] },
  { body: 'what kind of methods are callable as actions?', test: tests[2] },
  { body: 'some question with wrong answer?', test: tests[2] },
  { body: 'one more question with wrong answer?', test: tests[2] }
])

answers = Answer.create!([
{ body: 'compact', correct: true, question: questions[0] },
{ body: 'correct answer', correct: true, question: questions[0] },
{ body: 'Test question', correct: true, question: questions[0] },
{ body: 'Another test question', correct: true, question: questions[0] },
{ body: 'first()', correct: true, question: questions[1] },
{ body: 'length', correct: true, question: questions[2] },
{ body: 'map', correct: true, question: questions[3] },
{ body: 'min', correct: true, question: questions[4] },
{ body: 'each', correct: true, question: questions[5] },
{ body: 'empty?', correct: true, question: questions[6] },
{ body: 'any?', correct: true, question: questions[7] },
{ body: 'length', correct: true, question: questions[8] },
{ body: 'ActionController', correct: true, question: questions[9] },
{ body: 'public', correct: true, question: questions[10] },
{ body: 'wrong answer', correct: false, question: questions[11] },
{ body: 'another wrong answer', correct: false, question: questions[12] }
])

results = Result.create!([
{ test: tests[0], user: users[1] },
{ test: tests[1], user: users[1] },
{ test: tests[4], user: users[1] },
{ test: tests[5], user: users[1] },
{ test: tests[6], user: users[1] },
{ test: tests[3], user: users[1] },
{ test: tests[2], user: users[2] }
])
