require_relative "classes/game"
require_relative "classes/player"
require_relative "classes/board"
require_relative "./assets.rb"

include Assets

board = Board.new

player1 = Human.new(
  name: "Player1",
  sign: "X",
  board: board
)

player2 = Computer.new(
  name: "Player2",
  sign: "O",
  board: board
)

game = Game.new({
                  player_one: player1,
                  player_two: player2,
                  board: board
                }, generate_board = method(:generate_board))

puts game.cycle
