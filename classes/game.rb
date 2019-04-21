require_relative "../modules/ui_module.rb"
require_relative "../modules/get_human_input.rb"
require_relative "../modules/minmax.rb"
# Main game class
class Game
  include UserInterfaceModule
  include GetHumanInput
  include Minimax

  attr_reader :board, :player_one, :player_two, :board_generate_method, :mode

  def initialize(game_args)
    @player_one = game_args[:player_one]
    @player_two = game_args[:player_two]
    @board = game_args[:board]
    @mode = game_args[:mode].to_i
  end

  def cycle
    until end_game?
      human_turn(player_one)
      mode == 2 ? human_turn(player_two) : computer_turn(self, player_two)
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

  def human_turn(player)
    unless end_game?
      choice = make_choice(player.name).to_i
      player.turn(choice)
    end
    generate_board_display(board.grid)
  end

  def computer_turn(game, player)
    unless end_game?
      choice = minimax(game, player)[:index]
      player.turn(choice)
    end
    generate_board_display(board.grid)
  end
end
