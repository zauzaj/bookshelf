require 'active_record'

class User < ActiveRecord::Base
  has_many :books, foreign_key: "author_id"
end
