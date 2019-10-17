
class Player
	attr_accessor :name, :score, :sign

	def initialize (player_name, player_sign)
		@name = player_name
		@sign = player_sign
		@score = 0
	end

end
