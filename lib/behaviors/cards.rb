class Cards
  def Cards.getDeck(params, session)
    Card.where(username: session[:username])
  end

  def Cards.createCard(body_as_hash, session)
    validateCreateCard(body_as_hash, session)
    card = Card.new
    card.stack = 'ready'
    card.username = session[:username]
    card.title = body_as_hash['title'].to_s
    card.body = body_as_hash['body'].to_s
    card.acceptance = body_as_hash['acceptance'].to_s
    card.save!
    return card.attributes
  end

  def Cards.promoteCard(params, session)

  end

  def Cards.validateCreateCard(body_as_hash, session)
    if session[:username].to_s == ''
      raise StandardError
    end
    if body_as_hash['title'].to_s == ''
      raise StandardError
    end
    if body_as_hash['body'].to_s == ''
      raise StandardError
    end
    if body_as_hash['acceptance'].to_s == ''
      raise StandardError
    end
  end

  def validatePromoteCard()

  end
end
