require 'bundler/setup'
require './app/api'
require 'warden'
require 'grape_token_auth'

Bundler.require

GrapeTokenAuth.setup_warden!(self)

run App::API
