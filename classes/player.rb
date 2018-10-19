# Player classes that will be playing the game
class Player
  attr_accessor :name, :sign, :moves
  def initialize(name, sign, parent)
    @name = name
    @sign = sign
    @moves = []
    @parent = parent
    @game_board = parent.board
  end

  def generate_board
    @parent.generate_board(@game_board)
  end

  def turn
    square_select = make_choice
    # if the square is still available then board[choice] = player.sign
    @game_board[square_select.to_i] = @sign
    # and then push the choice (convert it first to an integer) to player.moves
    @moves.push(square_select.to_i)
    # then call generate_board to visualize new state of the board
    generate_board
  end

end

# Human subclass
class Human < Player
  def make_choice
    # the player will be prompted to choose a square
    puts "#{@name} your move!"
    square_select = gets.chomp!
    # the response of the player will first be validated if it"s between 0 - 8
    # the response of the player will be checked if it"s already unavailable
    until square_select.between?("0", "8") && @game_board.include?(square_select.to_i)
      puts "Hey! invalid input. Select a valid square!"
      square_select = gets.chomp!
    end
    square_select
  end
end

class Computer < Player
  def make_choice
    # the computer will be randomly choose a square
    puts "#{@name} is thinking of a move!..."
    square_select = rand(0..@game_board.size).to_s
    # the response of the player will first be validated if it"s between 0 - 8
    # the response of the player will be checked if it"s already unavailable
    until square_select.between?("0", "8") && @game_board.include?(square_select.to_i)
      puts "Computer still thinking"
      square_select = rand(0..@game_board.size).to_s
    end
    square_select
  end
end