require_relative "../classes/game"
require_relative "../classes/player"
require_relative "../classes/board"

def run_game
  puts "1 Player | 2 Player"
  mode = gets.chomp!

  board = Board.new

  player1 = Player.new(
    name: "Player1",
    sign: "X"
  )

  player2 = Player.new(
    name: "Player2",
    sign: "O"
  )

  game = Game.new(
    player_one: player1,
    player_two: player2,
    board: board,
    mode: mode
  )

  game.generate_board_display(game.board.grid)
  puts game.cycle
end
