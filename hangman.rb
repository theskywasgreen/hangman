require_relative 'draw'

class Game
  def initialize
    @guess_counter = 0
    @guess = []
    @correct_guess = []
    phrase
    phrase_show
  end

  # reads in dictionary file, picks a random word between 5-12 characters long
  # and splits the word into an array of characters
  def phrase
    word_choice = File.read('5desk.txt').lines.select {|l| (5..12).cover?(l.strip.size)}.sample.strip
    @guess_word = word_choice.upcase.scan(/\w/)
    puts @guess_word.join(" ")
  end

  # creates a copy of the word to be guessed and replaces each letter with "_ "
  # which is then used to display the status of the players guesses
  def phrase_show
    @print_guess = @guess_word.inject([]) { |a,element| a << element.dup }
    @print_guess.each { |letter| letter.gsub!((/\w/), '_ ') }
  end

  # checks each letter of word to be guessed with the letter guessed by user. if
  # letter is found replace "_ " with the guessed letter
  def check_guess
    @guess_word.each_with_index do |letter, i|
      @print_guess.each_with_index do |l, j|
        j = i
        if @player_guess =~ /#{letter}/
          @print_guess[j] = @player_guess
          @swapped = true
          @correct_guess << @player_guess
          break
        else
          break
        end
      end
    end
    if @swapped != true
      @guess_counter += 1
    end
    @swapped = false
  end

  def check_win
    if @print_guess == @guess_word
      puts "\n#{@print_guess.join(" ")}"
      puts "YOU WON!"
      return true
    end
  end

  def check_lose
    if @guess_counter >= 8
      puts "GAME OVER. YOU'VE BEEN HUNG! :("
      return true
    end
  end

  def turn_setup
    puts "#{@print_guess.join(" ")}"
    print "\nPlease enter your letter choice: "
    @player_guess = gets.chomp.upcase
    @guess << @player_guess
    puts "\nPrevious Guesses: #{@guess.join(", ")}"
  end

  def play
    loop do
      break if check_lose
      turn_setup
      check_guess
      break if check_win
      guess_draw(@guess_counter)
    end
  end
end

Game.new.play
