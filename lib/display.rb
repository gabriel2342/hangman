module Display 
  
  def display_word_size
    puts "\n==> Your word has" + " #{word_size}".colorize(:cyan) + " letters.\n\n"
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
    welcome_banner 
    guess_init 
    game_overview 
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

  def body(das)
    das = das.colorize(:light_yellow)
    puts "    |        |              #{das}"
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

  def second_stand_piece(das)
    puts "    |                       #{das}"
  end

  def top
    puts "    __________"
    puts "    |/       |"
  end

  def bottom
    puts "    |"
    puts "    |\\___"
  end

  

  

  def all_incorrect_guesses
    puts "==> You have all of your incorrect guesses."
  end

  def current_results(string)
    puts "==> Here's where you stand: #{string}"
  end

  def num_incorrect_guesses(array)
    if array.empty?
      
      puts "==> Your past incorrect guesses are" + " NONE".colorize(:cyan)
    else
      p array
      puts "==> Your past incorrect guesses are #{array.join(" ")}"
    end

  end

  def remaining_incorrect_guesses(num)
    num = num.to_s.colorize(:cyan)
    puts "==> You have #{num} incorrect guesses remaining."
  end
  
  def display_warning
    puts "==> Your guess can only be a single letter of the English alphabet"
  end

  def display_warning_if_needed(char)
    
  end

end