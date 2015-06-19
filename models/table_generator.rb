class Table_Generator

    def Table_Generator.makeTable ( stack, username )
        cards = Stack_Container.new("users/" + username).getJSON()[stack]

        index = 1
        if stack == 'ready'
            index = 1
        elsif stack == 'progress'
            index = 2
        elsif stack == 'acceptance'
            index = 3
        end

        table = %Q{<table class="altrowstable" id="cardtable} + index.to_s + %Q{" style="float: left">
      	    <tr>
      		    <th>Title</th><th>Description</th><th>Verification</th></tr>}

        if (!cards.nil?)
        cards.each do |name, card|
            link = 'card?stack=' + stack + '&title=' + name
            table += %Q{<tr><th><a href="} + link + %Q{">} + name + %Q{</a></th>}
            card.each do |key, value|
                table += %Q{<th>}
                table += card[key]
                table += %Q{</th>}
            end
            table += %Q{</tr>}
        end
        end

        table += %Q{</table>}

        table
    end
end
