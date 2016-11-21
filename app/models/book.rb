require 'active_record'
require 'elasticsearch/model'

class Book < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  def self.search query
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title', 'description']
          }
        }
      }
    )
  end
end
