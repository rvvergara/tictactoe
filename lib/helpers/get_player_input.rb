require_relative "../helpers/minimax.rb"
# Module to prompt human for choice
module GetPlayerInput
  include Minimax

  def player_turn(game, player, board)
    unless end_game?
      choice = if game.mode == 1
                 player.sign == "X" ? human_choice(player.name).to_i : minimax(game, player)[:index]
               else
                 human_choice(player.name).to_i
               end
      player.turn(choice, board)
    end
    generate_board_display(board.grid)
  end

  private

  def human_choice(name)
    # the player will be prompted to choose a square
    puts "#{name} your move!"
    square_select = gets.chomp!
    # the response of the player will first be validated if it"s between 0 - 8
    # the response of the player will be checked if it"s already unavailable
    until square_select.between?("0", "8") && board.grid.include?(square_select.to_i)
      puts "Hey! invalid input. Select a valid square!"
      square_select = gets.chomp!
    end
    square_select
  end
end
