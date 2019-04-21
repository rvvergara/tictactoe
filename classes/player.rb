require_relative "../modules/minmax"
require_relative "../modules/get_human_input"

# Player classes that will be playing the game
class Player
  attr_reader :name, :sign, :moves, :board
  def initialize(player_args)
    @name = player_args[:name]
    @sign = player_args[:sign]
    @board = player_args[:board]
    @moves = []
  end

  def turn
    square_select = make_choice
    # if the square is still available then board[choice] = player.sign
    board.grid[square_select.to_i] = sign
    # and then push the choice (convert it first to an integer) to player.moves
    moves.push(square_select.to_i)
  end
end

# Human subclass
class Human < Player
  include GetHumanInput
end

# Computer Class
class Computer < Player
  include Minimax
  def make_choice
    minimax(@game_board, self)[:index]
  end
end
