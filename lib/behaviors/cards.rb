class Cards
  def Cards.getDeck(params, session)
    Card.where(username: session[:username])
  end

  def Cards.createCard(params, session)
    card = Card.new

    #card.save!
  end
end
