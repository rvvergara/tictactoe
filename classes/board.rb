# Board Class
class Board
  attr_reader :grid
  def initialize
    @grid = (0..8).to_a
  end
end