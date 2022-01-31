
require_relative './display.rb'

class Hangman
  include Display
  
  def initialize
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

  def winner?
    p "\n==> !!!!!Congratulations. You've won!!!!!!\n" if player_guess = @comp_word
  end

end



game = Hangman.new
word = game.new_word

game.welcome_banner
game.initial_guesses

until game.word_size >=5 && game.word_size <=10
  word = game.new_word
end
game.display_word_size

dash = game.dashes

p word
guesses = 8

8.times do
  game.player_guess
  if game.guess_correct?
    puts "\n==> Yay! Great Guess!!"
    puts "\n==> Your current results #{game.replace_dashes(dash)}"
    guesses -= 1
    puts "\n==> You have #{guesses} guesses remaining."
  else 
    guesses -=1 
    puts "\n==> Womp Womp. You have #{guesses} guesses remaining"
  end
  puts "\n==> Would you like to guess the word? Please enter yes or no"
  choice = gets.chomp.downcase
  if choice == 'yes'
    game.display_guess_word
    break if game.winner?
  end
end





