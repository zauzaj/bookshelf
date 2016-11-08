require 'rspec'
require 'rack/test'
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
      it 'should return list of books' do
        get '/books'
        expect(last_response.status).to eq(200)
      end
    end
  end
end
