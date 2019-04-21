require_relative "../modules/game_actions"
# Main game class
class Game
  # include GameActions
  attr_accessor :board, :player_one, :player_two, :board_generate_method
  def initialize(game_args, generate_board)
    @player_one = game_args[:player_one]
    @player_two = game_args[:player_two]
    @board = game_args[:board]
    @board_generate_method = generate_board
  end

  def cycle
    until end_game?
      player_turn(player_one)
      player_turn(player_two)
    end
  end

  # Method to check if one of the players has one
  def player_won?(player)
    board.winning_combo.any? { |combo| combo.all? { |choice| player.moves.include?(choice) } }
  end

  def end_game?
    player_won?(player_one) || player_won?(player_two) || board.empty_squares.empty?
  end

  private

  def player_turn(player)
    player.turn unless end_game?
    board_generate_method.call(board.grid)
  end
end
