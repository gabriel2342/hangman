
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
    load_or_play unless bool == 'new'
    words = File.open("google-10000-english-no-swears.txt")
    words_list = words.readlines.map(&:chomp)
    p @comp_word =  words_list.sample 
    until @comp_word.size >=5 && @comp_word.size <= 10   
      @comp_word = words_list.sample
    end
    @first_correct_guess = false
    @dash = ("-"*word_size).split("")
    @incorrect_guesses = MAX_GUESS
    @guessarr = []
    @guess = ""
    @letter = ""
    @dashstr = ""
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
    puts "\n==> Please enter your best guess for a letter in our secret word."
    @guess = gets.chomp
    #save?(@guess) if @guess.downcase == 'save'
  end

  def if_save?(input)
    save_game if input.downcase == 'save'
  end

  def validate_guess(char)
    false unless char =~ /[A-Za-z]/ && char.size == 1
  end

  def guess_correct?
    @comp_word.include?(@guess)
  end
  
  
  def replace_dashes(dashh)
    word_array.each_with_index do |char,i|
      if char == @guess
        dashh.delete_at(i)
        dashh.insert(i, char.colorize(:light_green))
      end
    end
   dashh.join("")
  end


  def game_round
    
    @dashstr = @dash.join("")
    while @incorrect_guesses > NO_GUESSES_LEFT

      @letter = player_guess
      if_save?(@letter)
      validate_guess(@letter)

      while validate_guess(@letter) == false
        display_warning
        @letter = player_guess
      end


      if guess_correct?
        @first_correct_guess = true
        @dashstr = replace_dashes(@dash)
        current_hangman(@incorrect_guesses, @dashstr)
        puts "\n==> Yay! Great Guess!!".colorize(:light_green)
        all_incorrect_guesses if @incorrect_guesses == MAX_GUESS
        num_incorrect_guesses(@guessarr)
        remaining_incorrect_guesses(@incorrect_guesses) if @incorrect_guesses != MAX_GUESS
      else
        @incorrect_guesses -= WRONG_GUESS
        current_hangman(@incorrect_guesses, @dashstr)
        @guessarr << @letter.colorize(:red)
        puts  "\n==> Womp Womp. Wrong.".colorize(:red)
        num_incorrect_guesses(@guessarr)
        remaining_incorrect_guesses(@incorrect_guesses)
      end

    end
  end

  def load_or_play
    puts "\n==> Would you like to play a new game or load an old one?\n==> Type 1 to start a new game\n==> OR 2 to load a game one"
    choice = gets.chomp.to_i
    if choice == 1
      Hangman.new('new')
    elsif choice == 2
      puts "Please enter the name of the file you would like to load: "
      file_name = gets.chomp
      game = deserialize(file_name)
      game.game_round
    end
  end

end


 
  

newgame = Hangman.new('')



  


  

  





