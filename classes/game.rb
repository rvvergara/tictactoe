# frozen_string_literal: true

# Main game class
class Game
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
  # Important variables
  attr_accessor :game_board
  class Player
    attr_accessor :name, :sign, :moves
    def initialize(name, sign)
      @name = name
      @sign = sign
      @moves = []
    end
  end

  # class Board will just create boards array
  class Board
    attr_accessor :board
    
    def initialize
      @board = (0..8).to_a
    end
  end

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
    generate_board(game_board.board)
    
    # Create players1 and 2 - initialize both players
    player_one = Player.new("Player1","X")
    player_two = Player.new("Player2","O")
    
    # Run a loop wherein players1 and 2 will each take turns until one wins or it"s a draw - game_cycle

  end

  def show_title
    puts "]]]]]]]] Tic - Tac - Toe [[[[[[[["
    puts "================================="
    puts "-- Created Date - 18 Sep 2018 --"
    puts "== Author - Ryan & Dipto =="
  end

  def turn(player)
    # the player will be prompted to choose a square
    puts "Please enter your square"
    square_select = gets.chomp!
    # the response of the player will first be validated if it's between 0 - 8
    until square_select.between?("0", "8") || game_board.include?square_select.to_i
      puts "Hey! wrong input.Please enter your square"
      square_select = gets.chomp!
    end
    # the response of the player will be checked if it's already unavailable

    # if the square is still available then @@board[choice] = player.sign
    # and then push the choice (convert it first to an integer) to player.moves
    # then call generate_board to visualize new state of the board
    
  end

  def game_cycle(player1, player2)
  
  end

  def check_win(player)
  end

  # TODO: remove this demo class
  def test
    puts "Hi there"
  end
end
