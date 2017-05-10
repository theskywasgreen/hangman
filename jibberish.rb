word_choice = File.read('5desk.txt').lines.select {|l| (5..12).cover?(l.strip.size)}.sample.strip
$guess_word = word_choice.upcase.scan(/\w/)
puts $guess_word.join(" ")
$guesses = 0
$guess = []
$print_guess = $guess_word.inject([]) { |a,element| a << element.dup }
$print_guess.each { |letter| letter.gsub!((/\w/), '_ ') }

  while $guesses < 8
    puts "#{$print_guess.join(" ")}"
    $player_guess = gets.chomp.upcase
    $guess << $player_guess
    check_guess
    puts "\n"
    guess_draw($guesses)
    puts "\n"
    puts "Previous Guesses: #{$guess.join(", ")}"
  end


&& @correct_guess.all? { |letter| @guess_word.include?(letter) })
