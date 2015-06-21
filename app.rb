require 'sinatra'
require 'json'
require_relative 'models/account.rb'
require_relative 'models/state'
require_relative 'models/table_generator'

enable :sessions
set :session_secret, Time.now.to_s + '123412341234' + Time.now.to_s

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
    @verified = Table_Generator.makeTable('verified', session[:username])
    erb :cards
end

get '/card' do
    sc = Stack_Container.new("users/" + session[:username]).getJSON()
    @stack = params[:stack]
    @title = params[:title]
    if @stack == 'ready'
       @disDemote = 'disabled' 
    end
    if @stack == 'verified'
       @disPromote = 'disabled' 
    end
    @body = sc[@stack][@title]['body']
    @acceptance = sc[@stack][@title]['acceptance']
    erb :card
end

get '/newcard' do
   erb :newcard 
end

get '/add' do
    title = params[:title]
    body = params[:body]
    acceptance = params[:acceptance]
    sc = Stack_Container.new("users/" + session[:username])
    sc.add('ready', title, body, acceptance)
    redirect '/cards'   
end

get '/action/*/*/*' do |action, stack, title|
    sc = Stack_Container.new("users/" + session[:username])
    if (action == 'edit')
        sc.remove(stack, title)
        sc.add(stack, title, params[:body], params[:acceptance])
    end
    if (action == 'promote')
        dst = 'progress' if stack == 'ready'
        dst = 'verified' if stack == 'progress'
        sc.transfer(stack, dst, title) 
    end
    if (action == 'demote')
        dst = 'ready' if stack == 'progress'
        dst = 'progress' if stack == 'verified'
        sc.transfer(stack, dst, title)
    end
    redirect '/cards'
end