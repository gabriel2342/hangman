
require_relative './display.rb'
require_relative './drawing.rb'
require_relative './save.rb'
require 'colorize'
require 'yaml'

MAX_GUESS = 8
INIT_NUM_WRONG = 0
NO_GUESSES_LEFT = 0
WRONG_GUESS = 1

class Hangman 
  
  include Display
  include HangmanDrawing
  include SaveLoad

  
  def initialize(bool)
    load_or_play unless bool == 0
    words = File.open("google-10000-english-no-swears.txt")
    words_list = words.readlines.map(&:chomp)
    @comp_word =  words_list.sample 
    until @comp_word.size >=5 && @comp_word.size <= 10   
      @comp_word = words_list.sample
    end
    start_game_display
    @first_correct_guess = false
    @dash = ("-"*word_size).split("")
    @incorrect_guesses = MAX_GUESS
    @correct_guess_arr = []
    @wrong_guess_arr = []
    @guess = ""
    @letter = ""
    @dashstr = ""
    p @comp_word
    game_round
  end

 #========================
 #Computer Word
 #========================

  def word_size
    @comp_word.size
  end

  def word_array
    @comp_word.chars
  end
  
  def new_word
    @comp_word
  end

  #============================
  # Gameplay
  #============================
 


  def player_guess
    puts "==> Please enter your best guess for a letter in our secret word"
    puts "==> OR type 'save' to save your game."
    @guess = gets.chomp
  end

  def if_save?(input)
    save_game if input.downcase == 'save'
  end

  def validate_guess(char)
    unless char =~ /[A-Za-z]/ && char.size == 1
      puts "\n==> Please only enter a single letter of the English alphabet!\n".yellow
      return false
    end

    if @correct_guess_arr.include?(char) || @wrong_guess_arr.include?(char)
      puts "\n==> You've played this letter already. Please guess again!\n".yellow
      return false
    end

  end

  def guess_correct?
    @comp_word.include?(@guess)
  end
  
  
  def replace_dashes(dashh)
    word_array.each_with_index do |char,i|
      if char == @guess
        dashh.delete_at(i)
        dashh.insert(i, char)
      end
    end
   dashh.join("")
  end

 


  def game_round
    
    @dashstr = @dash.join("")
    while @incorrect_guesses > NO_GUESSES_LEFT

      @letter = player_guess
      if_save?(@letter)
      while validate_guess(@letter) == false
        @letter = player_guess
      end


      if guess_correct?
        @first_correct_guess = true
        @dashstr = replace_dashes(@dash).light_green
        current_hangman(@incorrect_guesses, @dashstr)
        @correct_guess_arr << @letter
        puts "\n==> Yay! Great Guess!!".light_green
        all_incorrect_guesses if @incorrect_guesses == MAX_GUESS
        num_incorrect_guesses(@wrong_guess_arr)
        remaining_incorrect_guesses(@incorrect_guesses) if @incorrect_guesses != MAX_GUESS
        win_or_loss?(@comp_word, @dashstr, @incorrect_guesses)
      else
        @incorrect_guesses -= WRONG_GUESS
        current_hangman(@incorrect_guesses, @dashstr)
        @wrong_guess_arr << @letter
        puts  "\n==> Womp Womp. Wrong.".red
        num_incorrect_guesses(@wrong_guess_arr)
        remaining_incorrect_guesses(@incorrect_guesses)
        win_or_loss?(@comp_word, @dashstr, @incorrect_guesses)
      end

    end
  end

  def load_or_play
    puts "\n==> Would you like to play a new game or load an old one?\n==> Type 1 to start a new game\n==> OR 2 to load a game one"
    choice = gets.chomp.to_i
    if choice == 1
      Hangman.new(0)
    elsif choice == 2
      files = Dir.entries('./saved_games')
      files = files[0..-3]
      puts "\n   List of saved games:".yellow
      files.each_with_index {|file, i| puts "   #{i+1}. #{file}"}
      puts "\n==> Please enter the name of the file you would like to load."
      file_name = gets.chomp
      game = deserialize(file_name)
      game.game_round
    end
  end

  def win_or_loss?(word, str, guesse)
    if str == word
      puts "!!!!!!!!You've Won!!!!!!!!!".light_green
      play_again?
    end

    if guesse == NO_GUESSES_LEFT
      puts "Womp. Womp. Womp. Womp.".red
      play_again?
    end

  end

  def play_again?
    puts "==> Would you like to play again? (Type 'y' for yes or 'n' for no.)"
    choice = gets.chomp
    Hangman.new(1) if choice == 'y'
    puts "==> Thanks for playing! We hope to see you soon."
    exit
  end

end


 
  

newgame = Hangman.new(1)




  


  

  




