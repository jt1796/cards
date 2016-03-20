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
