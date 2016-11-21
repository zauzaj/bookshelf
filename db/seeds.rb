require_relative '../app/models/book'
require_relative '../app/models/user'
require 'pry-rails'

db_config = YAML::load(IO.read('config/database.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)

#Remove all indexes
#curl -XDELETE 'http://localhost:9200/*'
Book.destroy_all
User.destroy_all

author1 = User.create!(first_name: 'Rus', last_name: 'Olsen', email: 'rusolsen@test.com', password: 'password', password_confirmation: 'password')
250.times do |time|
  author1.books.create!(title: "Eloquent Ruby V#{time}", description: 'Ruby programming')
  author1.books.create!(title: "Ruby Pixic V#{time}", description: 'Advance Ruby')
  author1.books.create!(title: "Rails web apps V#{time}", description: 'Ruby on Rails web applications')
end

author2 = User.create!(first_name: 'Obie', last_name: 'Fernandez', email: 'obie@test.com', password: 'password', password_confirmation: 'password')

250.times do |time|
  author2.books.create!(title: "Learn to program V#{time}", description: 'Ruby for newbies')
  author2.books.create!(title: "Ruby pocket reference V#{time}", description: 'Another ruby book')
  author2.books.create!(title: "Ruby on Rails V#{time}", description: 'Ruby on Rails web applications')
end
author2.books.create!(title: "Go Lang in Action", description: 'Start making concurent web apps with GO')

Book.import(force: true)
puts "Final number of books is #{Book.count}"
