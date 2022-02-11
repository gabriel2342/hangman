# frozen_string_literal: true

require_relative './save_and_load'

MAX_GUESS = 8
WRONG_GUESS = 1

# validates guess object and moves guess to the correct array,
# updates how many incorrect guesses are avaiable, and creates
# and updates our dash string.
class PlayerGuess
  include SaveLoad

  def initialize
    @first_correct_guess = false
    @dash = nil
    @guess = nil
  end

  def display_word_size
    puts '==> Your word has'.yellow + " #{word_size}".cyan + ' letters.'.yellow
  end

  def init_dashes
    @dash = ('-' * word_size).split('')
  end

  def player_guess
    display_player_guess
    @guess = gets.chomp.downcase
  end

  def create_dash_string
    @dashstr = @dash.join('')
  end

  def guess_and_validate
    @letter = player_guess
    if_save?(@letter)
    @letter = player_guess while validate_guess(@letter) == false || guessed_already?(@letter) == false
  end

  def correct_guess_gameplay
    @first_correct_guess = true
    @dashstr = replace_dashes(@dash)
    display_current_hangman(@incorrect_guesses, @dashstr.light_green)
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

  def guessed_already?(char)
    if @correct_guess_arr.include?(char) || @wrong_guess_arr.include?(char)
      puts display_already_played.yellow
      false
    end
  end

  def validate_guess(char)
    unless char =~ /[A-Za-z]/ && char.size == 1
      puts display_only_single_letter.yellow
      false
    end
  end

  def num_incorrect_guesses(array)
    wrong_guesses = array.join(' ')
    wrong_guesses = wrong_guesses.red
    if array.empty?
      puts "==> Your past incorrect guesses are#{' NONE'.cyan}"
    else
      puts "==> Your past incorrect guesses are #{wrong_guesses}"
    end
  end

  def remaining_incorrect_guesses(num)
    num = num.to_s.colorize(:cyan)
    puts "==> You have #{num} incorrect guesses remaining."
  end
end
