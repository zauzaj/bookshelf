require 'rspec'
require 'grape'
require_relative '../app/api'

describe App::API do
  describe 'Simple test' do
    it 'should return array of 3' do
      expect([1,2,3].length).to eq 3
    end
  end
end
