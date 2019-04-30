require_relative "../helpers/ui_module.rb"
require_relative "../helpers/get_human_input.rb"
require_relative "../helpers/get_computer_input.rb"
# Main game class
class Game
  include UserInterfaceModule
  include GetHumanInput
  include GetComputerInput

  attr_reader :board, :player_one, :player_two, :board_generate_method, :mode

  def initialize(game_args)
    @player_one = game_args[:player_one]
    @player_two = game_args[:player_two]
    @board = game_args[:board]
    @mode = game_args[:mode].to_i
  end

  def cycle
    until end_game?
      human_turn(player_one, board)
      mode == 2 ? human_turn(player_two, board) : computer_turn(self, player_two, board)
    end
  end

  def player_won?(player)
    board.winning_combo.any? { |combo| combo.all? { |choice| player.moves.include?(choice) } }
  end

  private

  def end_game?
    is_finished = player_won?(player_one) || player_won?(player_two) || board.empty_squares.empty?
    game_end_display(winner) if is_finished
    is_finished
  end

  def winner
    return nil if board.empty_squares.empty?

    player_won?(player_one) ? player_one.name : player_two.name
  end
end
