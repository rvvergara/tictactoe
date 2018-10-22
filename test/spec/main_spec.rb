require_relative "../../classes/game"

RSpec.describe Game do
  game = Game.new
  player = Human.new("Human","X",game)
  computer = Computer.new("Computer", "O", game)
  describe "#initialize" do
    it "creates a board" do
      expect(game.board).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe "#game_start" do
    it "is able to create an instance of player" do
      expect([player.name, player.sign, player.moves]).to eql(["Human", "X", []])
    end
  end

  describe "#check_win" do
    it "can determine whether a player has won or not" do
      player.moves = [1,2,3]
      expect(game.check_win(player)).to eql(false)
      player.moves = [0,1,2]
      expect(game.check_win(player)).to eql(true)
    end

    it "determines if someone wins or it's a draw" do
      robots_game = Game.new
      robocop = Computer.new("Robocop","X",robots_game)
      terminator = Computer.new("Terminator", "O", robots_game)
      expect(robots_game.game_cycle(robocop,terminator)).to be_between(0,2)
    end

  end

  # Test check_draw 
  describe "#check_draw" do
    it "can determine whether a game draw" do
      game2 = Game.new
      game2.board = ['o','x','x','x','x','o','x','o','o']
      expect(game2.check_draw).to eql(true)
    end
  end

  # Test computer input
  describe "#make_choice" do
    it "returns the computer's choice which is a string form of a numeric value between 0 and 8" do
      expect(computer.make_choice).to be_between("0", "8")
    end
  end
end

# What to test:
# 1. Instance is creating a board array equal to [0,1,2,3,4,5,6,7,8]
# 2. Instance of game is able to create Player instance
# 3. Be able to check who wins based on winning pattern