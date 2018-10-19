require_relative "../classes/player"
require_relative "../assets"
# WINNING COMBOS CONSTANT
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

# Important Methods for game
module GameActions
  include Assets
  def game_start
    # Welcome screen - call show_title method
    show_title
    # Draw initial board - initialize board
    generate_board(board)
    # Create players1 and 2 - initialize both players
    player_one = Player.new("Player1", "X")
    player_two = Player.new("Player2", "O")

    # Run a loop wherein players1 and 2 will each take turns until one wins or it"s a draw - game_cycle
    game_cycle(player_one, player_two)
    game_end
  end

  def turn(player)
    # the player will be prompted to choose a square
    puts "#{player.name} your move!"
    square_select = gets.chomp!
    # the response of the player will first be validated if it"s between 0 - 8
    # the response of the player will be checked if it"s already unavailable
    until square_select.between?("0", "8") && board.include?(square_select.to_i)
      puts "Hey! invalid input. Select a valid square!"
      square_select = gets.chomp!
    end
    # if the square is still available then board[choice] = player.sign
    board[square_select.to_i] = player.sign
    # and then push the choice (convert it first to an integer) to player.moves
    player.moves.push(square_select.to_i)
    # then call generate_board to visualize new state of the board
    generate_board(board)
  end

  def game_cycle(player1, player2)
    board.size.times do
      turn(player1)
      if check_win(player1)
        puts "Player One Win!"
        return
      end
      break if check_draw

      turn(player2)
      if check_win(player2)
        puts "Player Two Win!"
        return
      end
      break if check_draw
    end
    puts "It's a Draw!!!"
  end

  def check_win(player)
    WINNING_COMBOS.each do |combo|
      return true if combo.all? { |square| player.moves.include?(square) }
    end
    false
  end

  def check_draw
    return true if board.all? { |c| c.is_a? String }
  end

  def game_end
    puts "Hey! Do you wanna play again?[y,n]"
    choice = gets.chomp!.downcase
    until %w[y n yes no].include?(choice)
      puts "Invalid input!Play again?[y,n]"
      choice = gets.chomp!.downcase
    end
    if %w[y yes].include?(choice)
      Game.new.game_start
    else
      puts "Thank you dawg!!! Have some Kitkat"
      exit
    end
  end
end
