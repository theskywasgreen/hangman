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
      when 'n'
        return
      end
    end

    def save_name
      if File.exist?("#{@save_name_file}.yml")
        save = File.open("#{@save_name_file}.yml", 'w') { |file| file.write(self.to_yaml) }
        return
      else
        Dir.mkdir('saved_games') unless File.exist?('saved_games')
        Dir.chdir('saved_games')
        puts "Enter savename: "
        @save_name_file = gets.chomp
        save = File.open("#{@save_name_file}.yml", 'w') { |file| file.write(self.to_yaml) }
      end
    end

    def open
      Dir.chdir('saved_games')
      files = Dir.glob("*.{yml}")
      puts "Here are your saved files to choose from: "
      puts files
      print "Please enter filename (without extension) you wish to play: "
      @save_name_file = gets.chomp
      loop do
        if File.exist?("#{@save_name_file}.yml")
          YAML.load_file("#{@save_name_file}.yml").play
          break
        else
          print "No file found. Please retry: "
          @save_name_file = gets.chomp
        end
      end
    end
end



# use mkdir to store saved file names - use this to ask which saved game the user wants to
# restore from.
# if save_name.file exists? - so that user is only asked to enter a name for the file once.
