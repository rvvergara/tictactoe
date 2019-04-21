require_relative "../modules/ui_module.rb"
# Main game class
class Game
  include UserInterfaceModule

  attr_reader :board, :player_one, :player_two, :board_generate_method, :mode

  def initialize(game_args)
    @player_one = game_args[:player_one]
    @player_two = game_args[:player_two]
    @board = game_args[:board]
    @mode = game_args[:mode].to_i
  end

  def cycle
    if mode == 2
      until end_game?
        player_turn(player_one)
        player_turn(player_two)
      end
    end
  end

  def player_won?(player)
    board.winning_combo.any? { |combo| combo.all? { |choice| player.moves.include?(choice) } }
  end

  def end_game?
    is_finished = player_won?(player_one) || player_won?(player_two) || board.empty_squares.empty?
    game_end_display if is_finished
    is_finished
  end

  private

  def player_turn(player)
    player.turn unless end_game?
    generate_board_display(board.grid)
  end
end
