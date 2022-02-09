# frozen_string_literal: true

require_relative './display'
require_relative './drawing'
require_relative './save'
require_relative './word_and_guess'
require 'colorize'
require 'yaml'

MAX_GUESS = 8
INIT_NUM_WRONG = 0
NO_GUESSES_LEFT = 0
WRONG_GUESS = 1

# Our main class where gameplay is laid out

class Hangman < CompWordPlayerGuess
  
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
    @letter = nil
    @dashstr = nil
    game_round
  end
  
 #========================
 #Computer Word
 #========================

def init_dashes
  @dash = ('-'*word_size).split('')
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
    win_or_loss?(@@comp_word, @dashstr, @incorrect_guesses)
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




  


  

  





