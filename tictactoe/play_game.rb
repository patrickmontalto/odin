require 'tictactoe'

# Playing the game

print "Would you like to play Tic Tac Toe? (yes/no) "
play = gets.chomp.downcase
players = []

if play == "yes"
  puts "Great! You'll need two players"
  puts "Who will be the first player? (O)" 
  players << gets.chomp.capitalize
  puts "Who will be the second player? (x)"
  players << gets.chomp.capitalize
  game = TicTacToe.new(players)
  game.start_game
elsif play == "no"
  puts "Goodbye!"
else 
  puts "You have entered an invalid command."
end