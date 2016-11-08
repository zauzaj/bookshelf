require 'rake'
require 'grape-route-helpers'
require 'grape-route-helpers/tasks'
require 'bundler/setup'
load 'tasks/otr-activerecord.rake'

task :environment do
  require File.expand_path('app/api.rb', File.dirname(__FILE__))
end

namespace :db do
  task :environment do
    require_relative 'config/application'
  end
end
