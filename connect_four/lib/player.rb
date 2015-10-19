# Player class
class Player
  attr_accessor :marker
  attr_reader :name
  def initialize(name, marker = nil)
    if name.is_a?(String)
      @name = name
      @marker = marker
    else
      raise "Please enter a string"
    end
  end
end