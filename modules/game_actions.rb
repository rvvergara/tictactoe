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
    # Create players1 and 2 - initialize both players
    player_one = Human.new("Player1", "X", self)
    mode = game_mode
    player_two = Human.new("Player2", "O", self) if mode == 2
    player_two = Computer.new("Computer", "0", self) if mode == 1

    # Draw initial board - initialize board
    generate_board(board)
    # Run a loop wherein players1 and 2 will each take turns until one wins or it"s a draw - game_cycle
    game_cycle(player_one, player_two)
    game_end
  end

  def game_mode
    puts "Choose Game"
    puts "|1 - Human vs Computer | |2 - Human vs Human|"
    choice = gets.chomp!
    until %w[1 2].include?(choice)
      puts "Invalid Option"
      puts "|1 - Human vs Computer | |2 - Human vs Human|"
      choice = gets.chomp!
    end
    choice.to_i
  end

  def game_cycle(player1, player2)
    board.size.times do
      player1.turn
      if check_win(player1)
        puts "Player One Win!"
        return
      end
      break if check_draw

      player2.turn
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
