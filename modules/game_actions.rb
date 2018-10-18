# Important Methods for game
module GameActions
  # generate_board will draw board itself
  def generate_board(arr)
    (0...arr.size).each do |i|
      print "\n" if i == 0 || i == 3 || i == 6
      print "|" if i == 1 || i == 4 || i == 7
      print arr[i].class == String ? " #{arr[i]} " : "   "
      print "|" if i == 1 || i == 4 || i == 7
      print "\n" if i == 2 || i == 5 || i == 8
      print "------------" if i == 2 || i == 5
    end
  end
  def game_start
    # Welcome screen - call show_title method
    show_title
    # Draw initial board - initialize board
    @game_board = Board.new
    generate_board(@game_board.board)
    
    # Create players1 and 2 - initialize both players
    player_one = Player.new("Player1","X")
    player_two = Player.new("Player2","O")
    
    # Run a loop wherein players1 and 2 will each take turns until one wins or it"s a draw - game_cycle
    game_cycle(player_one,player_two)
  end

end