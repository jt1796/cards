post '/login' do
  begin
    if Login.can_login(params)
      session[:username] = params[:username].to_s
      return Account.find(session[:username])
    else
      body 'incorrect password'
      status 401
    end
  rescue StandardError => e
    body 'account not found'
    status 403
  end
end

post '/newaccount' do
  begin
    return Login.create_account(params)
  rescue StandardError => e
    body 'account creation failed'
    status 400
  end
end
