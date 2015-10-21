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
      @active_player = @player1
		else
			puts "Those are not players"
		end
	end

	def start
		while !@winner
      case @active_player
      when @player1
        move = get_move(@player1)
        place_move(move,@player1)
        @active_player = @player2
      when @player2
        move = get_move(@player2)
        place_move(move,@player2)
        @active_player = @player1
      else
        raise "An active player is not currently assigned."
      end
      print_board
      @winner = check_board
		end
		puts "#{@winner.name} has won!"
	end

	def get_move(player)
		puts "#{player.name}'s turn, please enter a column (A..G):"
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
    assemble_board
    col_separator, row_separator = " | ", "--+---+---+---+---+---+--"
    header = ("A".."G").to_a.join(col_separator)
    row1 = @printed_board[0].join(col_separator)
    row2 = @printed_board[1].join(col_separator)
    row3 = @printed_board[2].join(col_separator)
    row4 = @printed_board[3].join(col_separator)
    row5 = @printed_board[4].join(col_separator)
    row6 = @printed_board[5].join(col_separator)
    puts " #{header} \n #{row_separator} \n #{row1} \n #{row_separator} \n #{row2} \n #{row_separator} \n #{row3} \n #{row_separator} \n #{row4} \n #{row_separator} \n #{row5} \n #{row_separator} \n #{row6} \n #{row_separator}"  
  end

  def assemble_board
    @printed_board = [ [],[],[],[],[],[] ]
    0.upto(5) do |row|
      "a".upto("g") do |col|
        if @board[col][(row-5).abs].nil?
          @printed_board[row] << " "
        else
          @printed_board[row] << @board[col][(row-5).abs]
        end
      end
    end
  end

  def check_board
    found = false
    # create array of rows
    assemble_board

    # create array of columns
    columns = []
    ("a").upto("g") do |key|
      columns << @board[key]
    end

    # check across rows
    @printed_board.each do |row|
      if (row[0..3].all? { |x| x == row[0]}) || (row[1..4].all? { |x| x == row[1]}) || (row[2..5].all? {|x| x == row[2]})
        found = row[3] unless row[3] == " "
      elsif (row[3..6].all? {|x| x == row[3]}) || (row[4..7].all? {|x| x == row[4]})
        found = row[5] unless row[5] == " "
      end
    end
    # check across columns
    if found == false
      columns.each do |col|
        if (col[0..3].all? { |x| x == col[0]}) || (col[1..4].all? { |x| x == col[1]}) || (col[2..5].all? {|x| x == col[2]})
          found = col[3] unless col[3].nil?
        elsif (col[3..6].all? {|x| x == col[3]})
          found = col[5] unless col[5].nil?
        end
      end
    end

    # check diagonals
    if found == false
      gboard = @printed_board.reverse
      0.upto(2) do |i|
        0.upto(3) do |j|
          if gboard[i][i] == gboard[i+1][i+1] && gboard[i][i] == gboard[i+2][i+2] && gboard[i][i] == gboard[i+3][i+3]
            found = gboard[i][i] unless gboard[i][i] == " "
          end
        end
        6.downto(3) do |k|
          if gboard[i][i] == gboard[i+1][i-1] && gboard[i][i] == gboard[i+2][i-2] && gboard[i][i] == gboard[i+3][i-3]
            found = gboard[i][i] unless gboard[i][i] == " "
          end
        end
      end
    end

    # match player to found character
    case found
    when "\u25cf"
      player1
    when "\u25cb"
      player2
    else
      found
    end
  end

end













