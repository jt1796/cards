require 'sinatra'
require 'json'
require_relative 'models/account.rb'
require_relative 'models/state'

enable :sessions

protected_routes = Set.new ['/cards', '/api']
unprotected_routes = Set.new ['/login', '/submitlogin']

before do
        if (session[:username].nil?)
            pass if unprotected_routes.include? request.path_info
            redirect '/login'
        else
            #pass if protected_routes.include? request.path_info
            #redirect '/cards'
        end
end

get '/login' do
    erb :login
end

post '/submitlogin' do
    acc = Account.new(params[:username].to_s, params[:password].to_s )
        
    if (!acc.valid?)
        sleep 5
        redirect '/login'
    end

        
        session[:username] = params[:username].to_s
    redirect '/cards'
end

get '/cards' do
    erb :cards
end


get '/api' do
    content_type :json
    acc = Account.new(params[:username].to_s, params[:password].to_s)
    puts acc.valid?
    body = acc.stacks.getJSON.to_json
end
