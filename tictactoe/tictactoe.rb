# Tic Tac Toe in Ruby via Command Line!
require_relative 'player'
class TicTacToe
  attr_reader :player1, :player2, :board, :used_loc
  def initialize(players)
    @player1 = Player.new(players[0],"O")
    @player2 = Player.new(players[1],"X")
    @board = [[1,2,3],[4,5,6],[7,8,9]]
    @used_loc = []
    @game_over = false
    @player_turn = 1
  end

  # Game will run until game_over is true
  def start_game
    while !@game_over
      case @player_turn
      when 1
        play(@player1)
        @game_over = winner_check(@player1)
        @player_turn = 2 # Switch to player 2 on next loop
      when 2
        play(@player2)
        @game_over = winner_check(@player2)
        @player_turn = 1 # Switch to player 1 on next loop
      else
        "error"
      end
      if check_board == true
        @game_over = true
        puts "The game is now over. No winners."
      end
    end
  end

  # Prompt player for shape location
  def play(player)
    get_input = true
    print "#{player.name}'s turn. Enter location (1-9) for #{player.shape}: "
    while get_input
      location = gets.to_i
      if (1..9).include?(location) && !@used_loc.include?(location)
        get_input = false
      else
        print "Please enter a valid, unused location (1-9): "
      end
    end
    place_shape(player.shape,location)
    print_board
  end

  # Place shape in array
  def place_shape(shape, location)
    case location
    when 1; @board[0][0] = shape
    when 2; @board[0][1] = shape
    when 3; @board[0][2] = shape
    when 4; @board[1][0] = shape
    when 5; @board[1][1] = shape
    when 6; @board[1][2] = shape
    when 7; @board[2][0] = shape
    when 8; @board[2][1] = shape
    when 9; @board[2][2] = shape
    else; puts "error"
    end
    puts "#{shape} placed at #{location}!"
    @used_loc << location
  end

  def print_board
    col_separator, row_separator = " | ", "--+---+--"
    row1 = @board[0].join(col_separator)
    row2 = @board[1].join(col_separator)
    row3 = @board[2].join(col_separator)
    puts " #{row1} \n #{row_separator} \n #{row2} \n #{row_separator} \n #{row3} "
  end


  # returns true or false
  def winner_check(player)
    # Check across rows
    winner = false
    @board.each do |row|
      winner = true if row.uniq.size == 1
    end
    # Transpose array to check across columns
    @board.transpose.each do |col|
      winner = true if col.uniq.size == 1 
    end
    # Check diagonals
    if (@board[0][0] == @board[1][1]) && (@board[0][0] == @board[2][2]) ||
      (@board[0][2] == @board[1][1]) && (@board[0][2] == @board[2][0])
      winner = true 
    end
    puts congratulate(player) if winner == true
    winner
  end

  def congratulate(player)
    "#{player.name} has won the game!"
  end

  def check_board
    @used_loc.size == 9 ? true : false
  end

end



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