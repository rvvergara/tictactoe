require_relative "../modules/game_actions"
# Main game class
class Game
  include GameActions
  # Important variables
  attr_accessor :board, :player_one, :player_two
  def initialize
    @board = (0..8).to_a
  end

  def cycle
    end_game?
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
    player.turn
    player_won?(player) if end_game?
  end
end
