# Connect Four in Ruby via CLI
class Game
  attr_accessor :used_moves
	attr_reader :player1, :player2, :board
	def initialize(player1,player2)
		if player1.is_a?(Player) && player2.is_a?(Player)
      player1.marker = "\u25cf"
      player2.marker = "\u25cb"
			@player1 = player1
			@player2 = player2
			puts "Welcome to the game!"
      @used_moves = []
      @board = {"a" => [],"b" => [],"c" => [],"d" => [],"e" => [],"f" => [], "g" => []}
      @winner = false
		else
			puts "Those are not players"
		end
	end

	def start
		while !@winner
      @winner = check_board
		end
		puts "#{@winner.name} has won!"
	end

	def get_move(player)
		puts "#{player.name}'s, please enter a column (A..G):"
		input = gets.chomp.downcase
    if valid_move?(input)
      input
    else
      get_move(player)
    end
	end

  def valid_move?(column)
    # Will allow only if 5 or less rows in an on-board column are used
    if @board.include?(column)
      @board[column].size < 6
    else
      false
    end
  end

  def place_move(column, player)
    @board[column] << player.marker
  end

  def print_board
    printed_board = [ [],[],[],[],[],[] ]
    0.upto(5) do |row|
      "a".upto("g") do |col|
        if @board[col][(row-5).abs].nil?
          printed_board[row] << " "
        else
          printed_board[row] << @board[col][(row-5).abs]
        end
      end
    end
    col_separator, row_separator = " | ", "--+---+---+---+---+---+--"
    header = ("A".."G").to_a.join(col_separator)
    row1 = printed_board[0].join(col_separator)
    row2 = printed_board[1].join(col_separator)
    row3 = printed_board[2].join(col_separator)
    row4 = printed_board[3].join(col_separator)
    row5 = printed_board[4].join(col_separator)
    row6 = printed_board[5].join(col_separator)
    puts " #{header} \n #{row_separator} \n #{row1} \n #{row_separator} \n #{row2} \n #{row_separator} \n #{row3} \n #{row_separator} \n #{row4} \n #{row_separator} \n #{row5} \n #{row_separator} \n #{row6} \n #{row_separator}"  
  end

  def check_board
    
  end

end













