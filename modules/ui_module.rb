module UserInterfaceModule
  # generate_board will draw board itself
  def generate_board_display(arr)
    (0...arr.size).each do |i|
      print "\n" if [0, 3, 6].include? i
      print "|" if [1, 4, 7].include? i
      print arr[i].class == String ? " #{arr[i]} " : "   "
      print "|" if  [1, 4, 7].include? i
      print "\n" if [2, 5, 8].include? i
      print "------------" if [2, 5].include? i
    end
    puts "\n\n"
  end

  def game_end_display
    puts "Hey! Do you wanna play again?[y,n]"
    choice = gets.chomp!.downcase
    until %w[y n yes no].include?(choice)
      puts "Invalid input!Play again?[y,n]"
      choice = gets.chomp!.downcase
    end
    if %w[y yes].include?(choice)
      Game.new.game_start
    else
      puts "Thank you dawg!!! Have some Kitkat"
      exit
    end
  end
end
