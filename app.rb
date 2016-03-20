require 'sinatra'
require 'json'
Dir["models/*.rb"].each { |file| require_relative file }
Dir["controllers/*.rb"].each { |file| require_relative file }
Dir["lib/behaviors/*.rb"].each { |file| require_relative file }

enable :sessions
set :session_secret, Time.now.to_s + '123412341234' + Time.now.to_s
