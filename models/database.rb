require 'pg'

class Database

  @@conn = PG.connect(
      env['DATABASE_URL'],
      "5432",
      "", "",
      env['DATABASE_NAME'],
      env['DATABASE_USER'],
      env['DATABASE_PASSWORD'])

  def self.getUser ( username )
    user = @@conn.exec("SELECT * FROM USERNAMES WHERE username = '" + username + "'")
    return nil if user.ntuples == 0
    return user[0]
  end

  def self.addUser ( username, password )
    user = getUser ( username )
    return nil unless user.nil?
    partOne = "(" + username + "," + password + ")"
    partTwo = "(username,password)"
    query = "INSERT INTO USERNAMES " + partTwo + " VALUES " + partOne
    @@conn.exec(query)
  end

  def self.getCards ( username, stack )
    query <<HERE
SELECT * FROM CARDS WHERE username = #{username} AND stack = #{stack}
HERE
    cards = @@conn.exec(query)
    return cards
  end

  def self.addCard (username, stack, title, body, acceptance)
    card = getCard( username, stack, title )
    return nil unless card.nil?
    query = <<HERE
INSERT INTO CARDS (username, stack, title, body, acceptance) VALUES ('#{username}','#{stack}','#{title}','#{body}','#{acceptance}')
HERE
    @@conn.exec(query)
  end

  def self.removeCard ( username, stack, title )
    card = getCard(username, stack, title)
    return nil if card.nil?
    query = "DELETE FROM CARDS WHERE " +
            "username = " + "'" + username + "'" +
            " AND stack = " + "'" + stack  + "'" +
            " AND title = " + "'" + title + "'"
    @@conn.exec(query)
    return card
  end

  def self.getCard ( username, stack, title )
    query = "Select * FROM CARDS WHERE " +
            "username = " + "'" + username + "'" +
            " AND stack = " + "'" + stack  + "'" +
            " AND title = " + "'" + title + "'"

    card = @@conn.exec(query)
    return nil if card.ntuples == 0
    return card[0]
  end

end
