# Mastermind in Ruby via Command Line!
require_relative 'player'
class Mastermind
  def initialize(player, creator)
    @player = Player.new(player,creator)
    @turns = 12
    @game_over = false
    @creator = creator
    @colors = %w(r g b y m c)
  end

  # Game will run until game_over is set to true
  def start_game
    if @player.is_creator?
      while !@game_over
      end
    else
      generate_code
      while !@game_over
        guess
      end
    end
  end

  def generate_code
    @code = [@colors[rand(5)], @colors[rand(5)], @colors[rand(5)], @colors[rand(5)]]
  end

  def guess
    puts "What's the code, eh? Pick 4: (R)ed, (G)reen, (Y)ellow, (B)lue, (M)agenta, and (C)yan."
    code_guess = gets.chomp.downcase
  end

end



print "Welcome to Mastermind! Please enter your name: "
player = gets.chomp.capitalize

print "Would you like to be the creator? (yes/no)  "
response = gets.chomp.downcase
if response == 'yes'
  creator = true
elsif response == 'no'
  creator = false
else
  creator = false
end

game = Mastermind.new(player, creator)
game.start_game