require 'active_record'
require 'grape_token_auth'

class User < ActiveRecord::Base
  include GrapeTokenAuth::ActiveRecord::TokenAuth

  has_many :books, foreign_key: "author_id"
end
