# frozen_string_literal: true

# Main game class
class Game
  # Important variables
  class Player
    attr_accessor :name, :sign, :moves
    def initialize(name, sign)
      @name = name
      @sign = sign
      @moves = []
    end
  end
  def show_title
      puts "]]]]]]]] Tic - Tac - Toe [[[[[[[["
      puts "================================="
      puts "-- Created Date - 18 Sep 2018 --"
      puts "== Author - Ryan & Dipto =="
    end
  # TODO: remove this demo class
  def test
    puts 'Hi there'
  end
end
