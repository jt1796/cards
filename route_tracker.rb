require 'set'

class Routes

	@@protected_routes = Set.new [Regexp.new('/cards'), Regexp.new('/card'), Regexp.new('/newcard'), Regexp.new('/add'), Regexp.new('/action/\w+/\w+/\w+')]
	@@unprotected_routes = Set.new [Regexp.new('/login'), Regexp.new('/submitlogin'), Regexp.new('/newaccount'), Regexp.new('/viewusers')]

	def Routes.protected? ( route )
	    @@protected_routes.each do |r|
	        return true if route =~ r
	    end
	    return false
	end

	def Routes.unprotected? ( route )
	    @@unprotected_routes.each do |r|
	        return true if route =~ r
	    end
	    return false
	end

end