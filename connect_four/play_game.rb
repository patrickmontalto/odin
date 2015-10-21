require './lib/connect_four'
require './lib/player'
puts "Who is player 1?"
p1_name = gets.chomp
player1 = Player.new(p1_name)
puts "Who is player 2?"
p2_name = gets.chomp
player2 = Player.new(p2_name)

game = Game.new(player1,player2)
game.start

