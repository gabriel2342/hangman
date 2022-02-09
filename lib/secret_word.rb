module SecretWord

  
  def win_or_loss?(word, str, guesse)
    if str == word
      puts "!!!!!!!!You've Won!!!!!!!!!".light_green
      play_again?
    end

    if guesse == NO_GUESSES_LEFT
      puts "Womp. Womp. Womp. Womp.".red
      play_again?
    end

  end

  def play_again?
    puts "==> Would you like to play again? (Type 'y' for yes or 'n' for no.)"
    choice = gets.chomp
    Hangman.new(1) if choice == 'y'
    puts "==> Thanks for playing! We hope to see you soon."
    exit
  end
end