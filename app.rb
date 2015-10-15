require 'sinatra/base'
require 'active_record'
require 'mysql2'
require 'json'

p ENV['RACK_ENV']

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'] || 'development')

class User < ActiveRecord::Base
end

get '/' do
  'やっはろー'
end

get '/generate' do
  name = [*('a'..'z')].sample(16).join
  User.create(name: name, score: 0)
  name
end

get '/reset' do
  User.delete_all
  'deleted'
end

get '/ranking' do
  User.order(score: :desc).limit(50).to_json
end

get '/request' do
  name = params['name']
  user = User.find_by(name: name)
  return '404' unless user

  user.score += rand(100)
  user.save!
  'done'
end
