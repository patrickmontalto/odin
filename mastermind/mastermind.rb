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
    code_guessed = false
    if @player.is_creator?
      while !@game_over
        break # Debugging
      end
    else
      generate_code
      while !@game_over || @turns > 0
        guess
        code_guessed = check_guess(@code_guess)
        if @code == @code_guess
          puts "You guessed correctly!"
          @game_over = true
        else
          guess_feedback(@code_guess)
          @turns -=1
        end
      end
      puts "You ran out of guesses!" if @turns == 0
    end
  end

  def generate_code
    @code = [@colors[rand(5)], @colors[rand(5)], @colors[rand(5)], @colors[rand(5)]]
  end

  def guess
    puts "What's the code, eh? Pick 4: (R)ed, (G)reen, (Y)ellow, (B)lue, (M)agenta, and (C)yan:"
    @code_guess = gets.chomp.downcase
  end

  def guess_feedback(guess)
    indexes = [0,1,2,3,4,5]
    black = 0
    white = 0
    leftover_code = []
    leftover_guess = []
    @code.each_with_index do |elem, index|
      if code[index] == guess[index]
        black += 1
        indexes.delete(index)
      end
    end

    indexes.each do |index|
      leftover_code << code[index]
      letover_guess << guess[index]
    end

    # leftover_code = [r,r,g]
    # leftover_guess = [g,g,r] => [g,r]
    # returns white = 2

    # leftover_code = [r,g,g,c]
    # leftover_guess = [g,r,r,b] => [g,r,b]
    # returns white = 2

    # leftover_code = [r,r,g,g]
    # lefover_guess = [g,g,r,r] => flatten to [g,r] would only return 2!
    # returns white = 4
    # need a technique such as r => 2, g => 2
    # g => 2 r => 2 if g == g then white += g etc.
    # count number of each elements and store in hash ?
    guess.each do |elem|
      white += 1 if leftover_code.include?(elem)
    end
    # If guess[0] == code[0] => B += 1
    # ..
    # If guess[5] == code[5] => B += 1

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