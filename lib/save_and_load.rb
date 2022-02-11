# frozen_string_literal: true

# Contains the methods that save and load the games
module SaveLoad
  def save_game
    puts display_save_enter
    file_name = gets.chomp
    serialize(file_name)
  end

  def serialize(save_name)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    yaml = YAML.dump(self)
    game_file = File.new("saved_games/#{save_name}.yaml", 'w+')
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
      puts no_file(save_name)
      Hangman.new(0)
      sleep(5)
    end
  end

  def no_file(string)
    "Could not find file #{string}. Starting new game"
  end

  def if_save?(input)
    save_game if input.downcase == 'save'
  end

  def display_file_names
    files = Dir.entries('./saved_games')
    files = files[0..-3]
    puts display_list_saved.yellow
    files.each_with_index { |file, i| puts "   #{i + 1}. #{file}" }
  end

  def load_or_play
    puts display_load_or_play
    choice = gets.chomp.to_i
    case choice
    when 1
      Hangman.new(0)
    when 2
      display_file_names
      puts display_enter_name
      file_name = gets.chomp
      game = deserialize(file_name)
      game.game_round
    end
  end
end
