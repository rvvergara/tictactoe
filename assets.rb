# Module that will hold all presentation-related constants and functionalities
module Assets
  TITLE = %q(

   /$$$$$$$$/$$                               /$$$$$$$$                                      /$$$$$$$$
  |__  $$__/__/                              |__  $$__/                                     |__  $$__/
     | $$   /$$  /$$$$$$$                       | $$  /$$$$$$   /$$$$$$$                       | $$  /$$$$$$   /$$$$$$
     | $$  | $$ /$$_____/       /$$$$$$         | $$ |____  $$ /$$_____/       /$$$$$$         | $$ /$$__  $$ /$$__  $$
     | $$  | $$| $$            |______/         | $$  /$$$$$$$| $$            |______/         | $$| $$  \ $$| $$$$$$$$
     | $$  | $$| $$                             | $$ /$$__  $$| $$                             | $$| $$  | $$| $$_____/
     | $$  | $$|  $$$$$$$                       | $$|  $$$$$$$|  $$$$$$$                       | $$|  $$$$$$/|  $$$$$$$
     |__/  |__/ \_______/                       |__/ \_______/ \_______/                       |__/ \______/  \_______/




  ).freeze

  def show_title
    115.times { print "="; }
    puts "\n"
    puts TITLE
    115.times { print "="; }
    puts "\n\n"
    puts "-- Created Date - 18 Sep 2018 --"
    puts "== Author - Ryan & Dipto =="
  end

  # generate_board will draw board itself
  def generate_board(arr)
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
end
