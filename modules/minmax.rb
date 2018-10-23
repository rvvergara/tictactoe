module Minimax
  def empty_squares(arr)
    arr.select { |x| x.is_a? Integer}
  end

  def minimax(board, player)
    available_spots = empty_squares(board)
    # Check for terminal states
    return {:score => -10} if @parent.check_win(@parent.player_one)
    return {:score => 10} if @parent.check_win(@parent.player_two)
    return {:score => 0} if available_spots.size == 0
    # Collect scores from each empty square
    choices = []
    for i in 0...available_spots.size
      move = {}
      move[:index] = board[available_spots[i]]
      player.moves.push(board[available_spots[i]])
      board[available_spots[i]] = player.sign
      if player == @parent.player_two then
        result = minimax(board, @parent.player_one)
        move[:score] = result[:score]
      end #end of if
      if player == @parent.player_one then
        result = minimax(board, @parent.player_two)
        move[:score] = result[:score]
      end #end of if
      board[available_spots[i]] = move[:index]
      player.moves.pop
      choices.push(move)
    end #end of for loop
    if player.class == Computer then
      best = choices.sort {|a, b| b[:score] - a[:score]}[0]
    end #end of if player.class == Computer
    if player.class == Human then
      best = choices.sort {|a, b| a[:score] - b[:score]}[0]
    end #end of if player.class == Human
    best
  end #end of minimax
end #end of module