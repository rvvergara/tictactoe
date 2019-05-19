require_relative "../helpers/ui_module.rb"
require_relative "../helpers/get_player_input.rb"

# Main game class
class Game
  include UserInterfaceModule # Methods from UIModule: generate_board_display and game_end_display
  include GetPlayerInput

  attr_reader :board, :player_one, :player_two, :mode

  def initialize(game_args)
    @player_one = game_args[:player_one]
    @player_two = game_args[:player_two]
    @board = game_args[:board]
    @mode = game_args[:mode].to_i
  end

  def cycle
    until end_game?
      player_turn(self, player_one, board)
      player_turn(self, player_two, board)
    end
    game_end_display(winner) if end_game?
  end

  def player_won?(player)
    board.in_winning_combo?(player.moves)
  end

  private

  def end_game?
    player_won?(player_one) || player_won?(player_two) || board.available_spots.empty?
  end

  def winner
    return nil if board.available_spots.empty?

    player_won?(player_one) ? player_one.name : player_two.name
  end
end
