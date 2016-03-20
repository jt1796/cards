get '/login' do
  erb :login
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

post '/submitlogin' do
  account = Account.find(params[:username])
  puts account.password.to_s + 'x'
  puts params[:password].to_s + 'x'
  redirect '/login' if account.password != params[:password]
  session[:username] = params[:username].to_s
  redirect '/cards'
end
