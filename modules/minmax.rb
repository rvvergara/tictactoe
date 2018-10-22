orig_board = ["O", 1, "X", "X", 4, "X", 6, "O", "O"]

computer = {
  :sign => "X",
  :moves => [2, 3, 5],
}
human = {
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
  opponent = player == computer ? human : computer
  # Check if win,lose or draw
  return {:score => 10} if checkWin(player)
  return {:score => -10} if checkWin(opponent)
  return {score => 0} if available_squares.empty? 
  # Iterate through each of the available squares to score choices
  for i in 0...available_squares.size
    # store move in a hash with a property called index equal to the first element in available_squares
    move = {index => board_state[available_squares[i]]}
    # Store temporarily board_state affected element for later reset
    reset_el = board_state[available_squares[i]]
    # Change the value of the element in board_state
    board_state[available_squares[i]] = player[:sign]
    result = minmax(board_state, opponent)
    move.score = result.score
    choices.push(move)
    board_state[available_squares[i]] = reset_el
  end
  choices
end

puts minmax(orig_board, computer)
