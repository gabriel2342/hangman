module SaveLoad 

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

end