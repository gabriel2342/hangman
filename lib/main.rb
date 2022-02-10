# frozen_string_literal: true

require_relative './display'
require_relative './drawing'
require_relative './save_and_load'
require_relative './secret_word'
require_relative './guess'
require 'colorize'
require 'yaml'

NO_GUESSES_LEFT = 0


# Our main class where the gameplay happens

class Hangman < SecretWord

  include Display
  include HangmanDrawing
  include SaveLoad
  
  def initialize(num)    
    load_or_play unless num.zero? #output introduction unless a game has already been played
    start_game
    game_round
  end
 
  def start_game 
    choose_game_word
    start_game_display
    init_dashes
  end

  def start_game_display
    welcome_banner 
    guess_init 
    game_overview 
    display_word_size
  end


 def game_round
    p @@secret_word
    
    while @@incorrect_guesses > NO_GUESSES_LEFT

      guess_and_validate
        
      if guess_correct?
        correct_guess_gameplay
        correct_guess_stats
      else
        wrong_guess_gameplay
        wrong_guess_stats
      end
      win_or_loss?(@@incorrect_guesses)
    end
  end

  

  
end

 Hangman.new(1)




  


  

  





