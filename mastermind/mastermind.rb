# Mastermind in Ruby via Command Line!
require_relative 'player'
class Mastermind
  def initialize(player, creator)
    @player = Player.new(player,creator)
    @turns = 12
    @game_over = false
    @creator = creator
    @colors = %w(r g b y m c)
    @board = ["==========================="]
  end

  # Game will run until game_over is set to true
  def start_game
    code_guessed = false
    if @player.is_creator?
      @s = %w(r g b y c m).repeated_permutation(4).to_a
      @s[0], @s[7] = @s[7], @s[0]
      puts "Enter your secret code! Pick 4: (R)ed, (G)reen, (Y)ellow, (B)lue, (M)agenta, and (C)yan:"
      @code = gets.chomp.downcase.scan(/[rgybmc]/).map {|n| n}
      @code_guess = []
      while !@game_over
        computer_guess
        if @code == @code_guess
          puts "The computer guessed the code correctly!"
          puts "The code was #{@code}"
          @game_over = true
        else
          results = guess_feedback(@code_guess)
          @s.delete_if {|possible_guess| guess_feedback(possible_guess) == results}
          print_board
          @turns -=1
        end
        sleep(1)
        puts "#{@turns} left for the CPU!" unless @game_over || @turns == 0
        if @turns == 0
          puts "The computer ran out of guesses! The code was #{@code}!"
          @game_over = true
        end
      end
    else
      generate_code
      while !@game_over
        guess
        if @code == @code_guess
          puts "You guessed correctly!"
          puts "The code was #{@code}"
          @game_over = true
        else
          guess_feedback(@code_guess)
          print_board
          @turns -=1
        end
        puts "#{@turns} guesses left!" unless @game_over || @turns == 0
        if @turns == 0
          puts "You ran out of guesses! The code was #{@code}!"
          @game_over = true
        end
      end
    end
  end

  def generate_code
    @code = [@colors[rand(5)], @colors[rand(5)], @colors[rand(5)], @colors[rand(5)]]
  end

  def guess
    puts "What's the code, eh? Pick 4: (R)ed, (G)reen, (Y)ellow, (B)lue, (M)agenta, and (C)yan:"
    @code_guess = gets.chomp.downcase.scan(/[rgybmc]/).map {|n| n}
    return @code_guess if @code_guess.size == 4
    puts "That code does not meet the criteria. Please try again"
    return guess
  end

  def guess_feedback(guess)
    indexes = [0,1,2,3]
    @black = 0
    @white = 0
    leftover_code = []
    leftover_guess = []
    @code.each_with_index do |elem, index|
      if @code[index] == guess[index]
        @black += 1
        indexes.delete(index)
      end
    end

    indexes.each do |index|
      leftover_code << @code[index]
      leftover_guess << guess[index]
    end

    leftover_guess.each do |n|
      if leftover_code.include?(n)
        @white += 1
        leftover_code.delete_at(leftover_code.index(n))
      end
    end
    return [@black, @white]
  end

  def print_board
    puts "Current board: "
    result = @code_guess.join(' ')
    @board << "|##{@turns}| [#{result}] - [B-#{@black} W-#{@white}]"
    @board << "==========================="
    @board.each do |row|
      puts row
    end
  end

  def computer_guess
    @code_guess = @s[0]
    puts "Computer is making a guess of #{@code_guess}!"
    @code_guess
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