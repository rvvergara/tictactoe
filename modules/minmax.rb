orig_board = ["O", 1, "X", "X", 4, "X", 6, "O", "O"]

$computer = {
  :sign => "X",
  :moves => [2, 3, 5],
}
$human = {
  :sign => "O",
  :moves => [0, 7, 8],
}

WINNING_COMBOS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
].freeze

def emptySquares(arr)
  arr.select { |x| x.is_a? Integer}
end

def checkWin(player)
  WINNING_COMBOS.each do |combo|
    return true if combo.all? {|square| player[:moves].include? square}
  end
  false
end

def minmax(board, player)
  # Make a copy of orig_board
  board_state = board.slice(0..-1)
  # Determine available squares
  available_squares = emptySquares(board_state)
  # Store final choice in a hash 
  choice = {}
  # Store different choices into an array
  choices = []
  # Store opponent in a variable
  opponent = player == $computer ? $human : $computer

  return {:score => 10} if checkWin($computer) 
  return {:score => -10} if checkWin($human) 
  return {:score => 0} if available_squares.size == 0 

  for i in 0...available_squares.size
    # Store move
    move = {:index => board_state[available_squares[i]]}
    # Store in a temporary variable the square which will be played, for resetting later
    reset_el = board_state[available_squares[i]]
    # Place move
    board_state[available_squares[i]] = player[:sign]
    # Run method recursively and store result of recursive call into result, set move's score property to result's score
    result = minmax(board_state, opponent)
    move[:score] = result[:score]
    choices.push(move)
    # Reset board_state
    board_state[available_squares[i]] = reset_el
  end

  #Determine computer's best move based on maximizing score in the choices array
  if(player == $computer) then
    best = -1000
    choices.each do |choice|
      best = choice[:score] if choice[:score] > best
      return choice  
    end
  end 

  if(player == $human) then
    best = 1000
    choices.each do |choice|
      best = choice[:score] if choice[:score] < best
      return choice  
    end
  end 
end

puts minmax(orig_board, $computer)