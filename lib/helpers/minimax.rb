module Minimax
  def minimax(game, player)
    board = game.board
    available_spots = board.available_spots
    # Check for terminal states
    return { score: -10 } if game.player_won?(game.player_one)
    return { score: 10 } if game.player_won?(game.player_two)
    return { score: 0 } if available_spots.empty?

    # Collect scores from each empty square
    choices = []
    (0...available_spots.size).each do |i|
      move = {}
      move[:index] = board.grid[available_spots[i]]
      player.moves.push(board.grid[available_spots[i]])
      board.grid[available_spots[i]] = player.sign
      if player == game.player_two
        result = minimax(game, game.player_one)
        move[:score] = result[:score]
      end
      # end of if
      if player == game.player_one
        result = minimax(game, game.player_two)
        move[:score] = result[:score]
      end
      # end of if
      board.grid[available_spots[i]] = move[:index]
      player.moves.pop
      choices.push(move)
    end
    # end of for loop
    best = choices.min { |a, b| b[:score] - a[:score] } if player == game.player_two
    # end of if player.class == Computer
    best = choices.min { |a, b| a[:score] - b[:score] } if player == game.player_one
    # end of if player.class == Human
    best
  end
  # end of minimax
end
# end of module
