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
end