class Login
  def Login.can_login(params)
    account = Account.find(params[:username])
    return false if account.password != params[:password]
    true
  end
end
