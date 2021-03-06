# frozen_string_literal: true

# This module containts all of the string objects used in our classes
# that are not containt in our drawing module
module Display
  def display_thanks
    '==> Thanks for playing! We hope to see you soon.'
  end

  def display_only_y_n
    "==> Please only enter 'y' or 'n'"
  end

  def display_file_saved
    'File Saved successfully'
  end

  def display_list_saved
    "\n   List of saved games:"
  end

  def display_save_enter
    "\n==> Please enter the name of the file you would like to save."
  end

  def display_enter_name
    "\n==> Please enter the name of the file you would like to load."
  end

  def display_you_won
    "!!!!!!!!You've Won!!!!!!!!!"
  end

  def display_you_lost
    'Womp. Womp. Womp. Womp.'
  end

  def display_play_again
    "==> Would you like to play again? (Type 'y' for yes or 'n' for no.)"
  end

  def display_load_or_play
    "\n==> Would you like to play a new game or load an old one?\n==> Type 1 to start a new game\n==> OR 2 to load a game one"
  end

  def display_already_played
    "\n==> You've played this letter already. Please guess again!\n"
  end

  def display_only_single_letter
    "\n==> Please only enter a single letter of the English alphabet!\n"
  end

  def display_great_guess
    "\n==> Yay! Great Guess!!!"
  end

  def display_womp_womp
    "\n==> Womp Womp. Wrong."
  end

  def display_player_guess
    puts "\n==> Please enter your best guess for a letter in our secret word"
    puts "==> OR type 'save' to save your game."
  end

  def welcome_banner
    puts "\n\t\t  ================================"
    puts "\t\t       Welcome to Hangman!!!!!"
    puts "\t\t  ================================"
  end

  def game_overview
    puts "\n==> The classic game of Hangman has been played in school classrooms"
    puts '==> for a long time. Here are some guidelines for our Hangman game:'
    puts "\n    1) A secret word is chosen randomly by our computer and will be"
    puts '       between 5-10 letters long. The word CAN be a name or a place.'
    puts "    2) You're allowed 8 incorrect guesses when trying to decipher"
    puts '       the secret word.'
    puts '    3) You can save your game at anytime by typing save when prompted.'
    puts "\n==> Now, let's get started!!!. Choose wisely and flourish.\n\n"
  end

  def head
    puts '    |       (_)'
  end

  def arms_one
    puts '    |      __|'
  end

  def arms_two
    puts '    |      __|__'
  end

  def arms_and_hands
    puts '    |     o__|__o'
  end

  def legs_and_feet
    puts '    |      _/ \\_ '
  end

  def legs_one
    puts '    |       /'
  end

  def legs_two
    puts '    |       / \\'
  end

  def stand_piece
    puts '    |'
  end

  def top
    puts '    __________'
    puts '    |/       |'
  end

  def bottom
    puts '    |'
    puts '    |\\___'
  end

  def display_all_incorrect_guesses
    puts '==> You have all of your incorrect guesses.'
  end

  def display_warning
    puts '==> Your guess can only be a single letter of the English alphabet'
  end
end

# EOF
