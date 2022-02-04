 
 module Display 
  
  def display_word_size
    puts "\n==> Your word has #{word_size} letters.\n\n"
  end

  def welcome_banner
    puts "\n================================"
    puts "     Welcome to Hangman!!!!!"
    puts "================================"
  end
    
  def game_overview  
    puts "\n==> For each attempt you will be given an opportunity to guess"
    puts "==> a letter and match it with a letter in our secret word."
    puts "==> The secret word is choosen randomly by our computer and will"
    puts "==> be between 5-10 letters long." 
    puts "==> You're allowed 8 incorrect guesses when trying to decipher" 
    puts "==> our secret word."
    puts "==> Let's get started!!! Choose wisely and flourish\n\n"
  end

  def start_game_display
    welcome_banner #output welcome banner
    guess_8 #output hangnman stand
    game_overview #output game description and rules
    display_word_size
  end

  def head
    puts "    |       (_)"
  end

  def arms_one
    puts "    |      __|"
  end

  def arms_two
    puts "    |      __|__"
  end

  def arms_and_hands
    puts "    |     o__|__o"
  end

  def body
    puts "    |        |"
    puts "    |        |"
  end

  def legs_and_feet
    puts "    |      _/ \\_ "
  end

  def leg_one
    puts "    |       /"
  end

  def legs_two
    puts "    |       / \\"
  end

  def stand_piece
    puts "    |"
  end

  def top
    puts "    __________"
    puts "    |/       |"
  end

  def bottom
    puts "    |"
    puts "    |\\___"
  end

  def great_guess
    puts "\n==> Yay! Great Guess!!"
  end

  def womp_womp
    puts "\n==> Womp Womp. Wrong."
  end 

  def all_incorrect_guesses
    puts "You have all of your incorrect guesses."
  end

  def current_results(string)
    puts "==> Here's where you stand: #{string}"
  end

  def num_incorrect_guesses(array)
    puts "==> Your past incorrect guesses are #{array.join(" ")}"
  end

  def remaining_incorrect_guesses(num)
    puts "==> You have #{num} incorrect guesses remaining."
  end
  
end



