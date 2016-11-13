require_relative './spec_helper'
require 'grape'
require_relative '../app/api'
require 'pry-rails'

describe App::API do
  include Rack::Test::Methods

  def app
    App::API
  end

  describe 'Simple test' do
    it 'should return array of 3' do
      expect([1,2,3].length).to eq 3
    end
  end

  context 'Book' do
    describe 'All Books' do
      before do
        get '/books'
      end
      it 'should return status 200' do
        expect(last_response.status).to eq 200
      end

      it 'should return list of books' do
        expect(last_response.body.length > 0).to be_truthy
      end
    end

    describe 'Get Book' do
      it 'should return status 200' do
        get '/books/1'
        expect(last_response.status).to eq 200
      end

      it 'should return status 404 - not found' do
        get '/books/15'
        expect(last_response.status).to eq 404
      end
    end

    describe 'Create Book' do
      it 'should return status 201' do
        post 'users/1/books', title: "Functional Javascript", description: 'Javascript Great Book'
        expect(last_response.status).to eq 201
      end

      it 'should return 404' do
        post 'users/4/books', title: 'Javascript 2', description: 'Another great JS book'
        expect(last_response.status).to eq 404
      end
    end
  end
end
