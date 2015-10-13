def knight_moves(starting, ending)
  board = build_board
  if starting.size != 2 || ending.size != 2
    return "You have entered an invalid position"
  end
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
