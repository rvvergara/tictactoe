# frozen_string_literal: true

require_relative "../../lib/classes/board.rb"

RSpec.describe Board do
  let(:board) { Board.new }
  let(:winning_moves) { [0, 1, 2]}
  let(:non_winning_moves) { [1, 2, 3]}


  describe "initialize" do
    it "has a public attribute grid" do
      expect(board.grid).to match((0..8).to_a)
    end
  end

  describe "available_spots" do
    context "all spots taken" do
      it "has a size of 0" do
        board.grid.each_with_index { |_, index| board.grid[index] = "X"}
        expect(board.available_spots.size).to eq(0)
      end
    end

    context "not all spots taken" do
      it "has a size greater than 0" do
        board.grid[5] = "X"
        expect(board.available_spots.size).to_not eq(0)
      end
    end
  end

  describe "in_winning_combo?" do
    context "player's moves in winning_combo array" do
      it "returns true" do
        expect(board.in_winning_combo?(winning_moves)).to be(true)
      end
    end

    context "player's moves not in winning_combo" do
      it "returns false" do
        expect(board.in_winning_combo?(non_winning_moves)).to be(false)
      end
    end
  end
end
