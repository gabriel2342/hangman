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
  attr_accessor :comp_word, :guess, :first_correct_guess, :incorrect_guesses, 
                :correct_guess_arr, :wrong_guess_arr, :letter, :dashstr

  def initialize(bool)    
    @first_correct_guess = false
    @incorrect_guesses = MAX_GUESS
    @correct_guess_arr = []
    @wrong_guess_arr = []
    @letter = nil
    @dashstr = nil
    load_or_play unless bool.zero? #output introduction unless a game has already been played
    start_game
    game_round
  end
  
 
def start_game 
  choose_game_word
  start_game_display
  init_dashes
end

def guessed_already?(char)
  if @correct_guess_arr.include?(char) || @wrong_guess_arr.include?(char)
    puts display_already_played.yellow
    return false
  end
end


 def guess_and_validate
  @letter = player_guess
  if_save?(@letter)
  @letter = player_guess while validate_guess(@letter) == false || guessed_already?(@letter) == false
 end

 def correct_guess_gameplay
  @first_correct_guess = true
  @dashstr = replace_dashes(@@dash).light_green
  display_current_hangman(@incorrect_guesses, @dashstr)
  @correct_guess_arr << @letter
  puts display_great_guess.light_green
 end 

 def correct_guess_stats
  display_all_incorrect_guesses if @incorrect_guesses == MAX_GUESS
  num_incorrect_guesses(@wrong_guess_arr)
   remaining_incorrect_guesses(@incorrect_guesses) if @incorrect_guesses != MAX_GUESS
 end

 def wrong_guess_gameplay
  @incorrect_guesses -= WRONG_GUESS
  display_current_hangman(@incorrect_guesses, @dashstr.red)
  @wrong_guess_arr << @letter
  puts display_womp_womp.red
 end

 def wrong_guess_stats
  num_incorrect_guesses(@wrong_guess_arr)
  remaining_incorrect_guesses(@incorrect_guesses)
 end



 def game_round
    p @@comp_word
    @dashstr = @@dash.join('')
    while @incorrect_guesses > NO_GUESSES_LEFT

      guess_and_validate
        
      if guess_correct?
        correct_guess_gameplay
        correct_guess_stats
      else
        wrong_guess_gameplay
        wrong_guess_stats
      end
      win_or_loss?(@incorrect_guesses)
    end
  end

  def win_or_loss?(guesse)
    if @@comp_word.light_green == @dashstr
      puts display_you_won.light_green
      play_again?
    end

    if guesse == NO_GUESSES_LEFT
      puts display_you_lost.red
      play_again?
    end
  end

  
end

 Hangman.new(1)




  


  

  





