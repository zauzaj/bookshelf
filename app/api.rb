require 'bundler/setup'
require 'active_record'
require_relative './models/book'
require_relative './models/user'
require_relative './utils/errors'
require_relative 'grape_token_auth_setup'
Bundler.require

db_config = YAML::load(IO.read('config/database.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)



module App
  class API < Grape::API
    include App::Utils::Errors

    format :json


    include GrapeTokenAuth::TokenAuthentication
    include GrapeTokenAuth::ApiHelpers
    include GrapeTokenAuth::MountHelpers

    mount_registration(to: '/auth', for: :user)
    mount_sessions(to: '/auth', for: :user)
    mount_token_validation(to: '/auth', for: :user)
    mount_confirmation(to: '/auth', for: :user)
    mount_omniauth(to: '/auth', for: :user)
    mount_password_reset(to: '/auth', for: :user)

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
        authenticate_user!
        author = User.find(params[:id])
        author.books.create title: params[:title], description: params[:description]
      end
    end
  end
end
