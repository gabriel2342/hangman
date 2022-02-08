module Display 
  def choose_play_again
    puts "==> Would you like to play again? (Type 'y' for yes or 'n' for no.)"
    choice = gets.chomp
  end

  def display_word_size
    puts "==> Your word has".yellow + " #{word_size}".cyan + " letters.".yellow
  end

  def welcome_banner
    puts "\n\t\t  ================================"
    puts "\t\t       Welcome to Hangman!!!!!"
    puts "\t\t  ================================"
  end
    
  def game_overview  
    puts "\n==> The classic game of Hangman has been played in school classrooms"
    puts "==> for a long time. Here are some guidelines for our Hangman game:"
    puts "\n    1) A secret word is chosen randomly by our computer and will be"
    puts "       between 5-10 letters long. The word CAN be a name or a place." 
    puts "    2) You're allowed 8 incorrect guesses when trying to decipher" 
    puts "       the secret word."
    puts "    3) You can save your game at anytime by typing save when prompted."
    puts "\n==> Now, let's get started!!!. Choose wisely and flourish.\n\n"
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
    puts "    |        |              #{das}"
    puts "    |        |"
  end

  def legs_and_feet
    puts "    |      _/ \\_ "
  end

  def legs_one
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

  def player_guess
    puts "\n==> Please enter your best guess for a letter in our secret word"
    puts "==> OR type 'save' to save your game."
    @guess = gets.chomp.downcase
  end

  def num_incorrect_guesses(array)
    red_guess = array.join(" ")
    red_guess = red_guess.red
    if array.empty?
      puts "==> Your past incorrect guesses are" + " NONE".cyan
    else
      puts "==> Your past incorrect guesses are #{red_guess}"
    end

  end

  def remaining_incorrect_guesses(num)
    num = num.to_s.colorize(:cyan)
    puts "==> You have #{num} incorrect guesses remaining."
  end
  
  def display_warning
    puts "==> Your guess can only be a single letter of the English alphabet"
  end

 

end