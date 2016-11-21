require 'bundler/setup'
require 'active_record'
require_relative './models/book'
require_relative './models/user'
require_relative './utils/errors'
Bundler.require

db_config = YAML::load(IO.read('config/database.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)



module App
  class API < Grape::API
    include App::Utils::Errors

    format :json

    resource :books do
      desc 'Return all books'
      get '/' do
        Book.all
      end

      desc 'Search all books'
      params do
        requires :q, type: String, desc: 'Query string'
      end
      get '/search' do
        books = Book.search(params[:q])
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
