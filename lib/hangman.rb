
require_relative './display.rb'
require_relative './drawing.rb'
require_relative './save.rb'
require 'colorize'
require 'yaml'


class Hangman
  
  include Display
  include HangmanDrawing
  include SaveLoad
  
  def initialize #creates list of 10000 words when initialized
    words = File.open("google-10000-english-no-swears.txt")
    words_list = words.readlines.map(&:chomp)
    #Checks to make sure our word is between 5 and 10 words long
    @comp_word =  words_list.sample    
    @comp_word = check_word(@comp_word)
    @dash = dashes
    start_game_display
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

  def check_word(word)
    until word_size >=5 && word_size <=10
      word =  words_list.sample    
     end
     word
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
  
  def dashes 
    d = "-"*word_size
    d.split("")
  end

  
  def replace_dashes(dash)
    word_array.each_with_index do |char,i|
      if char == @guess
        dash.delete_at(i)
        dash.insert(i, char)
      end
    end
   dash.join("")
  end


end



game = Hangman.new #initialize game




incorrect_guesses = 8 #initialize the numbers of guesses for each user 
guessarr =[] #array of wrong guesses by the user
letter = ""


while incorrect_guesses > 0
    letter = game.player_guess
    game.if_save?(letter)
    game.validate_guess(letter)
    while game.validate_guess(letter) == false
      puts "==> Your guess can only be a single letter of the English alphabet"
      letter = game.player_guess
    end

  if game.guess_correct?
    dashstr = game.replace_dashes(dash)
    game.current_hangman(incorrect_guesses)
    game.great_guess
    game.current_results(dashstr)
    game.all_incorrect_guesses if incorrect_guesses == 8
    game.num_incorrect_guesses(guessarr)
    game.remaining_incorrect_guesses(incorrect_guesses) unless incorrect_guesses == 8
  else 
    incorrect_guesses -=1
    game.current_hangman(incorrect_guesses)
    guessarr << letter
    game.womp_womp
    game.current_results(dash.join("")) if incorrect_guesses == 7
    game.current_results(dashstr) unless incorrect_guesses == 7
    game.num_incorrect_guesses(guessarr)
    game.remaining_incorrect_guesses(incorrect_guesses)
  end

  if incorrect_guesses == 0
    puts "==> You've lost. Great game!"
   # break
  #elsif dashstr == word
    puts "==> You've Won!"
    break
  end

end

  

  





