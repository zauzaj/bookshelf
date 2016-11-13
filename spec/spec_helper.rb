require 'simplecov'
SimpleCov.start

require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
