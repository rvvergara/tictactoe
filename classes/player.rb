# Player classes that will be playing the game
class Player
  attr_accessor :name, :sign, :moves
  def initialize(name, sign)
    @name = name
    @sign = sign
    @moves = []
  end
end
