# frozen_string_literal: true

require_relative './display'
require_relative './drawing'
require_relative './save'
require 'colorize'
require 'yaml'

MAX_GUESS = 8
INIT_NUM_WRONG = 0
NO_GUESSES_LEFT = 0
WRONG_GUESS = 1

# Our main class where gameplay is laid out

class Hangman 
  
  include Display
  include HangmanDrawing
  include SaveLoad

  
  def initialize(bool)
    load_or_play unless bool.zero?
    choose_game_word
    start_game_display
    init_dashes
    @first_correct_guess = false
    @incorrect_guesses = MAX_GUESS
    @correct_guess_arr = []
    @wrong_guess_arr = []
    @guess = nil
    @letter = nil
    @dashstr = nil
    game_round
  end
  
 #========================
 #Computer Word
 #========================

def init_dashes
  @dash = ("-"*word_size).split("")
end

def open_words_file
  File.open("google-10000-english-no-swears.txt")
end

def google_words_list
  open_words_file.readlines.map(&:chomp)
end

 def choose_game_word
  @comp_word =  google_words_list.sample 
  validate_game_word
end
 
def validate_game_word
  until @comp_word.size >=5 && @comp_word.size <= 10   
    choose_game_word
  end
end


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
    display_player_guess
    @guess = gets.chomp.downcase
  end

  def validate_guess(char)
    unless char =~ /[A-Za-z]/ && char.size == 1
      puts display_only_single_letter.yellow
      return false
    end

    if @correct_guess_arr.include?(char) || @wrong_guess_arr.include?(char)
      puts display_already_played.yellow
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
   dashh.join('')
  end

 def guess_and_validate
  @letter = player_guess
  if_save?(@letter)
  @letter = player_guess while validate_guess(@letter) == false
 end

 def game_round
    
    @dashstr = @dash.join('')
    while @incorrect_guesses > NO_GUESSES_LEFT

      guess_and_validate
        
      if guess_correct?
        @first_correct_guess = true
        @dashstr = replace_dashes(@dash).light_green
        display_current_hangman(@incorrect_guesses, @dashstr)
        @correct_guess_arr << @letter
        puts display_great_guess.light_green
        display_all_incorrect_guesses if @incorrect_guesses == MAX_GUESS
        num_incorrect_guesses(@wrong_guess_arr)
        remaining_incorrect_guesses(@incorrect_guesses) if @incorrect_guesses != MAX_GUESS
        
      else
        @incorrect_guesses -= WRONG_GUESS
        display_current_hangman(@incorrect_guesses, @dashstr.red)
        @wrong_guess_arr << @letter
        puts  display_womp_womp.red
        num_incorrect_guesses(@wrong_guess_arr)
        remaining_incorrect_guesses(@incorrect_guesses)
      end

    end
    win_or_loss?(@comp_word, @dashstr, @incorrect_guesses)
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

 Hangman.new(1)




  


  

  





