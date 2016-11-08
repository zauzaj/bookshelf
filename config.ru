require 'bundler/setup'

Bundler.require
require './app/api'
use OTR::ActiveRecord::ConnectionManagement

run App::API
