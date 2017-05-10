class Game
  def main
    puts "*******************************"
    puts "Welcome to Hangman"
    puts %q{Please select an option:

      1. New Game
      2. Load Save Game
      3. Exit}
      puts "\n*******************************"
      case gets.chomp
      when '1'
        play
      when '2'
        open
      when '3'
        return
      end
  end

    def save
      print "Save game? (y/n): "
      choice = gets.chomp.downcase
      while (choice != 'y') && (choice != 'n')
        print "\nPlease enter y or n only: "
        choice = gets.chomp.downcase
      end
      case choice
      when 'y'
      save_name
      save = File.open("saved_games/#{@save_name_file}.yml", 'w') { |file| file.write(self.to_yaml) }
      when 'n'
        return
      end
    end

    def save_name
      Dir.mkdir('saved_games') unless File.exist?('saved_games')
      if File.exist?("saved_games/#{@save_name_file}.yml")
        return
      else
        puts "Enter savename: "
        @save_name_file = gets.chomp
      end
    end

    def open
      Dir.chdir('saved_games')
      files = Dir.glob("*.{yml}")
      puts "Here are your saved files to choose from: "
      puts files
      puts "Please enter filename (without extension) you wish to play."
      filename = gets.chomp
      if File.exist?("#{filename}.yml")
        YAML.load_file("#{filename}.yml").play
      end
    end
end



# use mkdir to store saved file names - use this to ask which saved game the user wants to
# restore from.
# if save_name.file exists? - so that user is only asked to enter a name for the file once.
