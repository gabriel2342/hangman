

class Hangman

  attr_accessor :dasharray

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
  # Display
  #============================
  def display_word_size
    puts "==> Your word has #{word_size} letters.\n\n"
  end

  def welcome_banner
    puts "================================"
    puts "     Welcome to Hangman!!!!!"
    puts "================================"
  end
    
  def initial_guesses  
  puts "\n==> You'll have 8 chances to guess the right word.\n==> For each attempt you will be given an opportunity to guess a letter and match it with a letter in our word.\n==> The word is choosen randomly by our computer and will be between 5-10 letters long. \n==> Let's get started!!! Choose wisely and flourish\n\n"
  end

  def display_guess_word
    puts "Please enter your best guess at the word."
    @player_guess = gets.chomp
  end

  #============================
  # Gameplay
  #============================
  def player_guess
    puts "==>Please enter your guess"
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
    p "Congratulations. You've won!" if player_guess = @comp_word
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
    puts "You're correct"
    puts "Your current results #{game.replace_dashes(dash)}"
    guesses -= 1
    puts "You have #{guesses} guesses remaining."
  else 
    guesses -=1 
    puts "You're incorrect. You have #{guesses} guesses remaining"
  end

  game.display_guess_word
  break if game.winner?

end





