# Board Class
class Board
  attr_reader :grid, :winning_combo
  def initialize
    @grid = (0..8).to_a
    @winning_combo = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]

    ]
  end

  def available_spots
    grid.select { |square| square.class == Integer }
  end
end
