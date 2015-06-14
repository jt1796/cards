require_relative '../models/stack_container'

class Account

    def initialize( un, pw )
        @username = un
        @password = pw
        @stacks = Stack_Container.new("users/" + @username)
    end

    def valid?
        return @stacks.getJSON()[@username] == @password
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
