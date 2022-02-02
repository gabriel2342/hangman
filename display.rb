 
 module Display 
  #============================
  # Display
  #============================
  def display_word_size
    puts "\n==> Your word has #{word_size} letters.\n\n"
  end

  def welcome_banner
    puts "================================"
    puts "     Welcome to Hangman!!!!!"
    puts "================================"
  end
    
  def initial_guesses  
  puts "==> For each attempt you will be given an opportunity to guess a letter and match it with a letter in our secret word."
  puts "==> The secret word is choosen randomly by our computer and will be between 5-10 letters long." 
  puts "==> You're allowed 8 incorrect guesses when trying to decipher our secret word."

  puts "==> Let's get started!!! Choose wisely and flourish\n\n"
  end

  def display_guess_word
    @guess_array = []
    puts "\n==> Please enter your best guess at the word."
    @player_guess = gets.chomp
  end


  # def display_letters_guessed
  #   guess_array = []
  

 

end
