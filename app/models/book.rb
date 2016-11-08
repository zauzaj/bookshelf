class Book < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
end
