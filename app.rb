require 'sinatra'
require 'json'
require 'pg'
require_relative 'models/account.rb'
require_relative 'models/state'
require_relative 'models/table_generator'
require_relative 'route_tracker'
require_relative 'models/database'

enable :sessions
set :session_secret, Time.now.to_s + '123412341234' + Time.now.to_s

before do
        puts request.path_info
        if (session[:username].nil?)
            pass if Routes.unprotected? request.path_info
            puts 'redirected to login'
            redirect '/login'
        else
            pass if Routes.protected? request.path_info
            redirect '/cards'
        end
end

get '/login' do
    erb :login
end

get '/newaccount' do
   erb :newaccount 
end

post '/newaccount' do
    acc = Account.new(params[:username], params[:password])
    acc.create()
    redirect '/login'
end

post '/submitlogin' do
    acc = Account.new(params[:username].to_s, params[:password].to_s )

    if (!acc.valid?)
        sleep 5
        if (!acc.exists?)
           redirect '/newaccount'
        end
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

get '/viewusers' do
    Database.addCard('john', 'verified', 'database p2', 'add cards to database', 'cards can be created and viewed')
    'hello'
end
