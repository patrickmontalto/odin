class Knight_node
  attr_accessor :position, :parent
  def initialize(position, parent = nil)
    @position = position
    @parent = parent
  end
end

def knight_moves(starting, ending)
  board = build_board
  position = starting
  knight_node = Knight_node.new(starting, nil)
  queue = [knight_node]
  visited = []
  path = []

  if (starting.size != 2 || ending.size != 2) || (!board.include?(starting) || !board.include?(ending) )
    puts "You have entered an invalid position!"
    return
  else
    puts "You have entered a valid position"
  end

  # CODE HERE BELONGS UNDER ELSE STATEMENT
  while knight_node.position != ending
    knight_node = queue.shift
    if !visited.include?(knight_node)
      visited << knight_node
      current_possible_moves(knight_node.position).each do |m|
        k_node = Knight_node.new(m,knight_node)
        queue << k_node
      end
    end
  end

  path << knight_node.position
  while knight_node.parent != nil
    path << knight_node.parent.position
    knight_node = knight_node.parent
  end
  
  puts "You made it in #{(path.size) -1} moves! Here's your path:"
  path.reverse.each{|movement| p movement}

end

def current_possible_moves(position)
  movements = []
  x = position[0]
  y = position[1]
  possible_moves = [[1,2],[-1,-2],[2,1],[-2,-1],[1,-2],[-1,2],[2,-1],[-2,1]]
  possible_moves.each do |movement|
    movements << [movement[0] +x , movement[1] + y]
  end
  movements
end

def build_board
  board = []
  0.upto(7) do |x|
    0.upto(7) do |y|
      board << [x,y]
    end
  end
  board
end

def off_board?(position)
  position[0] < 0 || position[0] > 7 || position[1] < 0 || position[1] > 7
end

puts "Welcome to knight.rb"
puts "Please enter your starting point (0,0 through 7,7)"
start_point = gets.chomp.split(',').map {|n| n.to_i}
puts "Please enter your ending point:"
ending_point = gets.chomp.split(',').map {|n| n.to_i}
knight_moves(start_point, ending_point)
