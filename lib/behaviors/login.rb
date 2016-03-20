class Login
  def Login.can_login(params)
    account = Account.find(params[:username])
    return false if account.password != params[:password]
    true
  end

  def Login.create_account(params)
    account = Account.new
    account.username = params[:username]
    account.password = params[:password]
    account.save
  end
end
