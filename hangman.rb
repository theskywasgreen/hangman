word_choice = File.read('5desk.txt').lines.select {|l| (5..12).cover?(l.strip.size)}.sample.strip
guess_word = word_choice.scan(/\w/)
puts guess_word.inspect
guess = []
player_guess = gets.chomp
guess << player_guess
swapped = false

guess_word.each_with_index do |letter, i|
  guess.each_with_index do |l, i|
    if l =~ /#{letter}/
      print "#{l} "
      swapped = true
    else
      print "_ "
    end
  end
end
if swapped != true
  puts "\n\nNO LETTER"
end


# 8 guesses

#   ____________
#   |          |
#   |          O
#   |         \|/
#   |          |
#   |         / \
# __|\____________

#   ____________
#   |
#   |
#   |
#   |
#   |
# __|\____________
