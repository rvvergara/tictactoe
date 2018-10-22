require_relative "../../classes/game.rb"

RSpec.describe Game do
  game = Game.new
  describe "#game_start" do
    it "creates a board" do
      # game.start
      expect(game.board).to eql([0,1,2,3,4,5,6,7,8])
    end
  end
end