require 'sinatra'
require_relative 'models/account.rb'
require_relative 'models/state'

before do
	pass unless State.get_user().nil?
	pass if request.path_info == '/login' or request.path_info == '/submitlogin'
	redirect '/login'
end

get '/login' do
	erb :login
end

post '/submitlogin' do
	acc = Account.new(params[:username].to_s,
					  params[:password].to_s )

	if (!acc.valid?)
		sleep 5
		redirect '/'
	end

	State.set_user params[:username]

	redirect '/cards'
end

get '/cards' do
	erb :cards
end


get '/api' do
    body "{\"hi\": \"bye\"}"
end
