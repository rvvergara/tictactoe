require_relative "classes/game"
require_relative "classes/player"
require_relative "classes/board"
require_relative "./assets.rb"

include Assets

puts "1 Player | 2 Player"
mode = gets.chomp!

board = Board.new

player1 = Player.new(
  name: "Player1",
  sign: "X",
  board: board
)

player2 = Player.new(
  name: "Player2",
  sign: "O",
  board: board
)

game = Game.new(
  player_one: player1,
  player_two: player2,
  board: board,
  mode: mode
)

puts game.cycle
