post '/login' do
  begin
    if Login.can_login(params)
      session[:username] = params[:username].to_s
      Account.find(params[:username].to_s).attributes.to_json
    else
      body 'incorrect password'
      status 401
    end
  rescue StandardError => e
    puts e
    body 'account not found'
    status 403
  end
end

post '/newaccount' do
  begin
    Login.create_account(params).attributes.to_json
  rescue StandardError => e
    puts e
    body 'account creation failed'
    status 400
  end
end

get '/username' do
  session[:username].to_s
end
