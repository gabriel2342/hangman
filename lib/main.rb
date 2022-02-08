# frozen_string_literal: true

require_relative './display'
require_relative './drawing'
require_relative './save'
require_relative './secret_word'
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

  @correct_guess_arr = []
  @wrong_guess_arr = []
  @guess = ''
  @letter = ''
  @dashstr = ''

  def initialize(bool)
    @first_correct_guess = false
    @incorrect_guesses = MAX_GUESS
    load_or_play unless bool.zero?
    words = File.open('google-10000-english-no-swears.txt')
    words_list = words.readlines.map(&:chomp)
    @comp_word = words_list.sample
    @comp_word = words_list.sample until @comp_word.size >= 5 && @comp_word.size <= 10
    @dash = ('-' * word_size).split('')
    start_game_display
    game_round
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

  def guess_correct?
    @comp_word.include?(@guess)
  end

  def replace_dashes(dashh)
    word_array.each_with_index do |char, i|
      if char == @guess
        dashh.delete_at(i)
        dashh.insert(i, char)
      end
    end
    dashh.join('')
  end

  def validate_guess(char)
    check_if_letter_and_size

    if @correct_guess_arr.include?(char) || @wrong_guess_arr.include?(char)
      puts "\n==> You've played this letter already. Please guess again!\n".yellow
      false
    end
  end

  def game_round
    @dashstr = @dash.join('')
    p @incorrect_guesses
    while @incorrect_guesses > NO_GUESSES_LEFT

      @letter = player_guess
      if_save?(@letter)
      @letter = player_guess while validate_guess(@letter) == false

      if guess_correct?
        @first_correct_guess = true
        @dashstr = replace_dashes(@dash).light_green
        current_hangman(@incorrect_guesses, @dashstr)
        @correct_guess_arr << @letter
        puts "\n==> Yay! Great Guess!!".light_green
        all_incorrect_guesses if @incorrect_guesses == MAX_GUESS
        num_incorrect_guesses(@wrong_guess_arr)
        remaining_incorrect_guesses(@incorrect_guesses) if @incorrect_guesses != MAX_GUESS
      else
        @incorrect_guesses -= WRONG_GUESS
        current_hangman(@incorrect_guesses, @dashstr)
        @wrong_guess_arr << @letter
        puts "\n==> Womp Womp. Wrong.".red
        num_incorrect_guesses(@wrong_guess_arr)
        remaining_incorrect_guesses(@incorrect_guesses)
        
      end
    end
  end
end

Hangman.new(1)