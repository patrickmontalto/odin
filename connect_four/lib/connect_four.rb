class Game
	attr_reader :player1, :player2
	def initialize(player1,player2)
		if player1.is_a?(Player) && player2.is_a?(Player)
			@player1 = player1
			@player2 = player2
			puts "Welcome to the game!"
		else
			puts "Those are not players"
		end
	end

	def start
		while !winner
		end
		puts "#{winner.name} has won!"
	end

	def winner
	end
end