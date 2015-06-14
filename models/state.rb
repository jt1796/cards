class State

	@@user_logged_in = nil

	def self.get_user
		@@user_logged_in
	end

	def self.set_user ( user )
		@@user_logged_in = user
	end

end