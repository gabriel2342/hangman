module Game

    
    
  
    

  def game_round
    @incorrect_guesses
    @letter = player_guess
    if_save?(@letter)
    while validate_guess(@letter) == false
      @letter = player_guess
    end

    if guess_correct?
      @guessarr << @letter
      @first_correct_guess = true
      @dashstr = replace_dashes(@dash)
      current_hangman(@incorrect_guesses)
      
      great_guess
      all_incorrect_guesses if @incorrect_guesses == MAX_GUESS
      num_incorrect_guesses(@guessarr)
      remaining_incorrect_guesses(@incorrect_guesses) unless @incorrect_guesses == MAX_GUESS
    else
      @incorrect_guesses -= 1
      current_hangman(@incorrect_guesses)
      @guessarr << @letter
      womp_womp
      num_incorrect_guesses(@guessarr)
      remaining_incorrect_guesses(@incorrect_guesses)
    end
    @incorrect_guesses
  end

  def player_guess
    puts "\n==> Please enter your best guess for a letter in our secret word."
    @guess = gets.chomp
    #save?(@guess) if @guess.downcase == 'save'
  end
      
  def validate_guess(char)
    if @guessarr != nil
      if @guessarr.include?(char) 
        puts "You have already guessed this letter"
        false
      elsif char !~ /[A-Za-z]/ || char.size != 1
        puts "==> Your guess can only be a single letter of the English alphabet"
        false
      end
    end
  end

  def win_or_loss?
    if @incorrect_guesses == 0
      puts "You've lost. Great gamw!"
      
    elsif @dashstr == new_word
      puts "You've Won!"
    end
  end

  def first_guess
    return false if @first_correct_guess == false
  end

def second_stand_piece
  if first_guess == false
    puts "    |                       #{@dashse}"
  else
    puts "    |                       #{@dashstr}"
  end
end

def body 
    puts "    |        |"
    puts "    |        |               #{@dashstr}"
  end
end


#current_results(@dashe) if @first_correct_guess == false
#current_results(@dashstr) if @first_correct_guess == true