# Player classes that will be playing the game
class Player
  attr_reader :name, :sign, :moves, :board
  def initialize(player_args)
    @name = player_args[:name]
    @sign = player_args[:sign]
    @board = player_args[:board]
    @moves = []
  end

  def turn(index)
    board.grid[index] = sign
    moves.push(index)
  end
end
