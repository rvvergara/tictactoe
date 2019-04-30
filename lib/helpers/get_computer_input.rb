require_relative "./minmax.rb"
# Module to control how computer generates a chice
module GetComputerInput
  include Minimax
  def computer_turn(game, player, board)
    unless end_game?
      choice = minimax(game, player)[:index]
      player.turn(choice)
    end
    generate_board_display(board.grid)
  end
end
