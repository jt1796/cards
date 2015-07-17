class UserActiveRecord

  @username
  @password

  def new (username, password)
    @username = username
    @password = password
  end

  def load ()
    user = Database.getUser(@username)
    if user.nil?
      @username = nil
      @password = nil
    end
    @username = user['username']
    @password = user['password']
  end

  def save ()
    #What if the username already exists? Who decided to do an update?
    #Should addUser(...) update in the case of the user already existing?
    user = Database.addUser(@username, @password)
    if user.nil?
      Database.removeUser(@username)
    end
    Database.addUser(@username, @password)
  end
end