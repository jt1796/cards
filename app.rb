require 'sinatra'
require 'json'
require_relative 'route_tracker'
Dir["models/*.rb"].each { |file| require_relative file }
Dir["controllers/*.rb"].each { |file| require_relative file }


enable :sessions
set :session_secret, Time.now.to_s + '123412341234' + Time.now.to_s

before do
  if (session[:username].nil?)
    pass if Routes.unprotected? request.path_info
    redirect '/login'
  else
    pass if Routes.protected? request.path_info
    redirect '/cards'
  end
end
