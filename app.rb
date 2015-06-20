require 'sinatra'
require 'json'
require_relative 'models/account.rb'
require_relative 'models/state'
require_relative 'models/table_generator'

enable :sessions

protected_routes = Set.new ['/cards', '/card']
unprotected_routes = Set.new ['/login', '/submitlogin']

before do
        if (session[:username].nil?)
            pass if unprotected_routes.include? request.path_info
            redirect '/login'
        else
            #pass if protected_routes.include? request.path_info
            #redirect '/cards'6a
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
    @ready = Table_Generator.makeTable('ready', session[:username])
    @progress = Table_Generator.makeTable('progress', session[:username])
    @verified = Table_Generator.makeTable('acceptance', session[:username])
    erb :cards
end

get '/card' do
    sc = Stack_Container.new("users/" + session[:username]).getJSON()
    @stack = params[:stack]
    @title = params[:title]
    @body = sc[@stack][@title]['body']
    @verification = sc[@stack][@title]['acceptance']
    erb :card
end

get '/action/*/*/*' do |action, stack, title|
    action + ' ' + stack + ' ' + title
end
