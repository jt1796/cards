require_relative '../models/stack_container'

class Account

    def initialize( un, pw )
        @username = un
        @password = pw
        @exists = Pathname.new("users/" + @username).exist?
        @stacks = Stack_Container.new("users/" + @username) if @exists
        @valid = @stacks.getJSON()[@username] == @password if @exists
    end
    
    def create
       return if @exists
       user_data = {@username => @password}
       IO.write(Pathname.new("users/" + @username), JSON.generate(user_data))
    end
    
    def username
       @username 
    end
    
    def stacks
       @stacks 
    end

    def valid?
        @valid
    end
    
    def exists?
       @exists
    end

    def add ( stack, title, body, acceptance )
        @stacks.add( stack, title, body, acceptance )
    end

    def remove ( stack, title )
        @stacks.remove( stack, title )
    end

    def transfer (src, dst, title)
        @stacks.transfer( src, dst, title )
    end
end
