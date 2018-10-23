require_relative "../modules/game_actions"
# Main game class
class Game
  include GameActions
  # Important variables
  attr_accessor :board, :player_one, :player_two
  def initialize
    @board = (0..8).to_a
  end
end
