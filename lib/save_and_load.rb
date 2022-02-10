module SaveLoad 

  def save_game
    puts display_enter_name
    file_name = gets.chomp
    serialize(file_name)
   end

  def serialize(save_name)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    yaml = YAML.dump(self)
    game_file = File.new("./saved_games/#{save_name}.yaml", "w+")
    game_file.write(yaml)
    puts display_file_saved
    exit(true)
  end

  def deserialize(save_name)
    if File.exist?("saved_games/#{save_name}.yaml")
      game_file = File.new("saved_games/#{save_name}.yaml")
      yaml = game_file.read
      YAML.load(yaml)
    else
      puts "Could not find file #{save_name}. Starting new game"
      Hangman.new(0)
      sleep(5)
    end
  end

  def if_save?(input)
    save_game if input.downcase == 'save'
  end

  def load_or_play
    puts display_load_or_play
    choice = gets.chomp.to_i
    if choice == 1
      Hangman.new(0)
    elsif choice == 2
      files = Dir.entries('./saved_games')
      files = files[0..-3]
      puts display_list_saved.yellow
      files.each_with_index {|file, i| puts "   #{i+1}. #{file}"}
      puts display_enter_name
      file_name = gets.chomp
      game = deserialize(file_name)
      game.game_round
    end
  end
end