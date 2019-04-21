require_relative "../modules/minmax"
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
    # square_select = make_choice
    # if the square is still available then board[choice] = player.sign
    board.grid[index] = sign
    # and then push the choice (convert it first to an integer) to player.moves
    moves.push(index)
  end
end
