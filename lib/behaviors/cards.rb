class Cards
  def Cards.getDeck(params, session)
    Card.where(username: session[:username])
  end
end
