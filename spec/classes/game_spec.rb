# frozen_string_literal: true

require_relative "../../lib/classes/game.rb"
require_relative "../../lib/classes/board.rb"
require_relative "../../lib/classes/player.rb"

RSpec.describe Game do
  let(:player_one) { Player.new(name: "Human", sign: "X")}
  let(:player_two) { Player.new(name: "Computer", sign: "O")}
  let(:board) { Board.new }
  let(:game) { Game.new(player_one: player_one, player_two: player_two, board: board, mode: "1")}

  describe "initialize" do
    it "assigns public attributes" do
      expect(game.player_one).to equal(player_one)
      expect(game.player_two).to equal(player_two)
      expect(game.board).to equal(board)
      expect(game.mode).to be(1)
    end
  end

  describe "cycle" do
    context ""
  end
end
