require 'bundler/setup'
require 'active_record'
require_relative './models/book'
require_relative './models/user'

Bundler.require

db_config = YAML::load(IO.read('config/database.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)

module App
  class API < Grape::API
    format :json

    rescue_from ActiveRecord::RecordNotFound do |e|
      rack_response({ "status": 404, "message": "Not Found." }, 404)
    end

    resource :books do
      desc 'Return all books'
      get '/' do
        Book.all
      end

      desc 'Return specific book'
      params do
        requires :id, type: Integer, desc: 'Book id'
      end
      route_param :id do
        get do
          Book.find(params[:id])
        end
      end

    end

    resource :users do
      desc 'Create book'
      params do
        requires :title, type: String
        requires :description, type: String
      end
      post ':id/books' do
        author = User.find(params[:id])
        author.books.create title: params[:title], description: params[:description]
      end
    end
  end
end
