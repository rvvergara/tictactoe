# frozen_string_literal: true

require_relative "../../lib/classes/player.rb"
require_relative "../../lib/classes/board.rb"

RSpec.describe Player do
  let(:player) { Player.new(name: "Human", sign: "X") }

  let(:board) { Board.new }

  describe "initialize" do
    it "creates instance variable name" do
      expect(player.name).to eq("Human")
    end

    it "creates sign instance variable" do
      expect(player.sign).to eq("X")
    end

    it "assigns an empty array to instance variable moves" do
      expect(player.moves).to match([])
    end
  end

  describe "turn method" do
    it "pushes to the moves array of the player" do
      player.turn(0, board)
      expect(player.moves[0]).to be(0)
    end

    it "changes the character in the board at the index selected" do
      player.turn(0, board)
      expect(board.grid[0]).to be(player.sign)
    end
  end
end
