post '/login' do
  if Login.can_login(params)
    session[:username] = params[:username].to_s
  else
    #error
  end
end

get '/newaccount' do
  erb :newaccount
end

post '/newaccount' do
  account = Account.new
  account.username = params[:username]
  account.password = params[:password]
  account.save
  redirect '/login'
end
