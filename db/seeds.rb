require_relative '../app/models/book'
require_relative '../app/models/user'

db_config = YAML::load(IO.read('config/database.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)

User.destroy_all

author1 = User.create!(first_name: 'Rus', last_name: 'Olsen', email: 'Eloquent Ruby')
author1.books.create!(title: 'Eloquent Ruby', description: 'Ruby programming')
author1.books.create!(title: 'Ruby Pixic', description: 'Advance Ruby')
author1.books.create!(title: 'Rails web apps', description: 'Ruby on Rails web applications')

author2 = User.create!(first_name: 'Obie', last_name: 'Fernandez', email: 'Rails way')

author2.books.create!(title: 'Learn to program', description: 'Ruby for newbies')
author2.books.create!(title: 'Ruby pocket reference', description: 'Another ruby book')
author2.books.create!(title: 'Ruby on Rails', description: 'Ruby on Rails web applications')
