# frozen_string_literal: true

# moulde file
require_relative '../modules/game_actions'
include GameActions
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
  ]
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

  def show_title
    puts "]]]]]]]] Tic - Tac - Toe [[[[[[[["
    puts "================================="
    puts "-- Created Date - 18 Sep 2018 --"
    puts "== Author - Ryan & Dipto =="
  end

  def turn(player)
    # the player will be prompted to choose a square
    puts "#{player.name} your move!"
    square_select = gets.chomp!
    # the response of the player will first be validated if it's between 0 - 8
    # the response of the player will be checked if it's already unavailable
    until square_select.between?("0", "8") && game_board.board.include?(square_select.to_i)
      puts "Hey! invalid input. Select a valid square!"
      square_select = gets.chomp!
    end
    # if the square is still available then board[choice] = player.sign
    game_board.board[square_select.to_i] = player.sign
    # and then push the choice (convert it first to an integer) to player.moves
    player.moves.push(square_select.to_i)
    # then call generate_board to visualize new state of the board
    generate_board(game_board.board)
  end

  def game_cycle(player1, player2)
    game_board.board.size.times do
      turn(player1)
      if check_win(player1) then
        puts "Player One Win!"
        return
      end
      break if check_draw
      turn(player2)
      if check_win(player2) then
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
    return true if game_board.board.all? {|c| c.is_a? String}
  end

  # TODO: remove this demo class
  def test
    puts "Hi there"
    board = Board.new
    print board.board
  end
end
