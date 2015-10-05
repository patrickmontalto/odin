# Player class
class Player
  attr_accessor :creator, :wins
  attr_reader :name
  def initialize(name, creator)
    @name = name
    @creator = creator
    @wins = 0
  end
  def is_creator?
    @creator
  end
end