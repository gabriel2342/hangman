module SaveLoad 

  def save_game
    puts 'Enter a name for the file you want to save.'
    save_name = gets.chomp.downcase
    serialize(save_name)
  end

  def serialize(save_name)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    yaml = YAML.dump(self)
    game_file = File.new("./saved_games/#{save_name}.yaml", "w+")
    game_file.write(yaml)
    puts 'File Saved successfully'
    exit(true)
  end

  def deserialize(save_name)
    if File.exist?("saved_games/#{save_name}.yaml")
      game_file = File.new("saved_games/#{save_name}.yaml")
      yaml = game_file.read
      YAML.load(yaml)
    else
      puts "Could not find file #{save_name}. Starting new game"
      game = Hangman.new(0)
      sleep(3)
    end
  end







  # def load_game
  #   unless Dir.exist('saved_games')
  #     puts "No saved games found. Starting new game..."
  #     sleep(5)
  #     return
  #   end
  #   games = saved_games
  #   puts games
  #   deserialize(load_file(games))
  # end

  # def load_file(games)
  #   loop do
  #     puts 'Enter which saved_game would you like to load: '
  #     load_file = gets.chomp
  #     return load_file if games.include?(load_file)
  #     puts 'The game you requested does not exist.'
  #   end
  # end

  # def deserialize(load_file)
  #   yaml = YAML.load_file("./saved_games/#{load_file}.yml")
  #   @history = yaml[0].history


end