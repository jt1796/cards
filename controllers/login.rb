post '/login' do
  begin
    if Login.can_login(params)
      session[:username] = params[:username].to_s
    else
      body 'incorrect password'
      status 401
    end
  rescue StandardError
    body 'account not found'
    status 403
  end
end

post '/newaccount' do
  account = Account.new
  account.username = params[:username]
  account.password = params[:password]
  account.save
  redirect '/login'
end
