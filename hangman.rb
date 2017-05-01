word_choice = File.read('5desk.txt').lines.select {|l| (5..12).cover?(l.strip.size)}.sample.strip


  ____________
  |          |
  |          O
  |         \|/
  |          |
  |         / \
__|\____________
