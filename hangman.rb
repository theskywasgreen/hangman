word_choice = File.read('5desk.txt').lines.select {|l| (5..12).cover?(l.strip.size)}.sample.strip
$guess_word = word_choice.upcase.scan(/\w/)
puts $guess_word.inspect
$guesses = 0
$guess = []
$print_guess = $guess_word.inject([]) { |a,element| a << element.dup }
$print_guess.each { |letter| letter.gsub!((/\w/), '_ ') }

def guess_draw(guess)
  case guess
  when 1
    puts "  ____________"
    puts "  |          |"
    puts "  |           "
    puts "  |           "
    puts "  |           "
    puts "  |           "
    puts "__|\\____________"
  when 2
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |           "
    puts "  |           "
    puts "  |           "
    puts "__|\\____________"
  when 3
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |          |"
    puts "  |           "
    puts "  |           "
    puts "__|\\____________"
  when 4
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |          |"
    puts "  |          |"
    puts "  |           "
    puts "__|\\____________"
  when 5
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |         \\|"
    puts "  |          |"
    puts "  |           "
    puts "__|\\____________"
  when 6
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |         \\|/"
    puts "  |          |"
    puts "  |           "
    puts "__|\\____________"
  when 7
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |         \\|/"
    puts "  |          |"
    puts "  |         / "
    puts "__|\\____________"
  when 8
    puts "  ____________"
    puts "  |          |"
    puts "  |          O"
    puts "  |         \\|/"
    puts "  |          |"
    puts "  |         / \\ "
    puts "__|\\____________"
  else
    puts "  ____________"
    puts "  |           "
    puts "  |           "
    puts "  |           "
    puts "  |           "
    puts "  |           "
    puts "__|\\____________"
  end
end

def check_guess
  $guess_word.each_with_index do |letter, i|
    $print_guess.each_with_index do |l, j|
      j = i
      if $player_guess =~ /#{letter}/
        $print_guess[j] = $player_guess
        $swapped = true
        correct_guess = []
        correct_guess << $player_guess
        break
      else
        break
      end
    end
  end
  if $swapped != true
    $guesses += 1
  end
  $swapped = false
end


while $guesses < 8
  puts "#{$print_guess.inspect}"
  $player_guess = gets.chomp.upcase
  $guess << $player_guess
  check_guess
  puts "\n"
  guess_draw($guesses)
  puts "\n"
  puts $guess.inspect
end





# def check_guess
#   $guess_word.each_with_index do |letter, i|
#     $guess.each_with_index do |l, i|
#       if l =~ /#{letter}/
#         print "#{l} "
#         $swapped = true
#       else
#         print "_ "
#       end
#     end
#   end
#   if $swapped != true
#     $guesses += 1
#   end
#   puts "\n"
#   guess_draw($guesses)
#   puts "\n"
# end
