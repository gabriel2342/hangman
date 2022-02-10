# frozen_string_literal: true

NO_GUESSES_LEFT = 0

require_relative './guess'

#This class creates and validates our secret word object
class SecretWord < PlayerGuess

  attr_accessor :secret_word

  @@secret_word = ""

  def open_words_file
    File.open('google-10000-english-no-swears.txt')
  end
  
  def google_words_list
    open_words_file.readlines.map(&:chomp)
  end

  def choose_game_word
    @@secret_word =  google_words_list.sample 
    validate_game_word
  end

  def validate_game_word
    until @@secret_word.size >=5 && @@secret_word.size <= 10   
      choose_game_word
    end
  end

  def word_size
    @@secret_word.size
  end

  def word_array
    @@secret_word.chars
  end
  
  def new_word
    @@secret_word
  end

  def guess_correct?
    @@secret_word.include?(@@guess)
  end

  def replace_dashes(dashh)
    word_array.each_with_index do |char,i|
      if char == @@guess
        dashh.delete_at(i)
        dashh.insert(i, char)
      end
    end
   dashh.join('')
  end

  def play_again?
    puts display_play_again
    choice = gets.chomp
    until choice == 'y' or choice == 'n'
      puts display_only_y_n
      choice = gets.chomp
    end
    Hangman.new(1) if choice == 'y'
    puts display_thanks
    exit
  end

  def win_or_loss?(guesse)
    if @@secret_word.light_green == @@dashstr.light_green
      puts display_you_won.light_green
      play_again?
    end

    if guesse == NO_GUESSES_LEFT
      puts display_you_lost.red
      play_again?
    end
  end

end