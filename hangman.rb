
require_relative './display.rb'
require_relative './drawing.rb'


class Hangman
  attr_accessor :guess_array
  include Display
  include HangmanDrawing
  
  def initialize #creates list of 10000 words when initialized
    @words = File.open("google-10000-english-no-swears.txt")
    @words_list = @words.readlines.map(&:chomp)
    
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
    @comp_word =  @words_list.sample 
  end

  #============================
  # Gameplay
  #============================
  def player_guess
    puts "\n==>Please enter your best guess for a letter in our secret word"
    @guess = gets.chomp
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
word = game.new_word #select our secret word

game.welcome_banner #output welcome banner
game.guess_1 #output hagnman stand
game.game_overview #outputs game description and rules


#Checks to make sure our word is between 5 and 10 words long
until game.word_size >=5 && game.word_size <=10
  word = game.new_word
end

#lets the user know how many letters are in the secret word
game.display_word_size

#creates a string of dashes based on the size of the words
dash = game.dashes

p word
incorrect_guesses = 8 #initialize the numbers of guesses for wach user 
guessarr =[] #array of wrong guesses by the user
game.guess_1 #output our hangman stand and initialize the stand variable


while incorrect_guesses > 0
  letter = game.player_guess
  if game.guess_correct?
    puts "\n==> Yay! Great Guess!!"
    dashstr = game.replace_dashes(dash)
    game.current_hangman(incorrect_guesses)
    puts "\n==> Your current results #{dashstr}"
    puts "==> Your past incorrect incorrect_guesses are #{guessarr}"
  else 
    incorrect_guesses -=1
    puts "\n==> Womp Womp. You have #{incorrect_guesses} incorrect_guesses remaining"
    game.current_hangman(incorrect_guesses)
    guessarr << letter
    puts "\n==> Your current results #{dashstr}"
    puts "\n==> You're past incorrect incorrect_guesses are #{guessarr}"
  end

  if incorrect_guesses == 0
    puts "You've lost. Great game!"
    break
  elsif dashstr == word
    puts "You've Won!"
    break
  end

end

  

  





