require_relative "../modules/minmax"
require_relative "../modules/get_human_input"
# Player classes that will be playing the game

class Player
  attr_reader :name, :sign, :moves, :game_board, :parent
  def initialize(name, sign, parent)
    @name = name
    @sign = sign
    @moves = []
    @parent = parent
    @game_board = @parent.board
  end

  def generate_board
    parent.generate_board(game_board)
  end

  def turn
    square_select = make_choice
    # if the square is still available then board[choice] = player.sign
    game_board[square_select.to_i] = sign
    # and then push the choice (convert it first to an integer) to player.moves
    moves.push(square_select.to_i)
    # then call generate_board to visualize new state of the board
    generate_board
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
end # Computer class end
