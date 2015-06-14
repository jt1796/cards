require 'pathname'
require 'json'

class Stack_Container
    #Assume the userfile exists and has at least the user/pw in its

    def initialize( pn )
        @path = pn
    end

    def getJSON()
        JSON.parse(IO.read(@path), {})
    end

    def saveJSON( data )
        IO.write(@path, JSON.generate(data))
    end

    def get( stack, title )
        return if !isStack stack
        data = getJSON
        if (data[stack].nil?)
            return nil
        end
        return data[stack][title]
    end

    def add( stack, title, body, acceptance)
        return if !isStack stack
        data = getJSON
        if (data[stack].nil?)
            data[stack] = Hash.new(Hash.new())
        end
        data[stack][title] = {'body' => body, 'acceptance' => acceptance}
        saveJSON data
    end

    def remove( stack, title )
        return if !isStack stack
        data = getJSON
        saveJSON data
        data = getJSON
        data[stack].delete title
        saveJSON data
    end

    def transfer( src, dst, title )
        data = getJSON
        return if !(isStack src and isStack src)
        return if data[src].nil? or data[src][title].nil?
        
        item = data[src][title]
        add(dst, title, item['body'], item['acceptance'])
        remove(src, title)
    end

    def isStack( stack )
        if !((stack == 'progress') or
             (stack == 'ready') or
             (stack == 'acceptance'))
            return false
        end
        return true
    end
end
