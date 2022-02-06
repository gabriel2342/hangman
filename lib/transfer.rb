first_correct_guess = false
dash = game.dashes
incorrect_guesses = MAX_GUESS #initialize the numbers of guesses for each user 
guessarr =[] #array of wrong guesses by the user
letter = ""


while incorrect_guesses > INIT_NUM_WRONG
    letter = game.player_guess
    game.if_save?(letter)
    game.validate_guess(letter)

    while game.validate_guess(letter) == false
      puts "==> Your guess can only be a single letter of the English alphabet"
      letter = game.player_guess
    end

  if game.guess_correct?
    first_correct_guess = true
    dashstr = game.replace_dashes(dash)
    game.current_hangman(incorrect_guesses)
    game.great_guess
    game.current_results(dashstr)
    game.all_incorrect_guesses if incorrect_guesses == MAX_GUESS
    game.num_incorrect_guesses(guessarr)
    game.remaining_incorrect_guesses(incorrect_guesses) unless incorrect_guesses == MAX_GUESS
  else 
    incorrect_guesses -=1
    game.current_hangman(incorrect_guesses)
    guessarr << letter
    game.womp_womp
    game.current_results(dash.join("")) if first_correct_guess == false
    game.current_results(dashstr) if first_correct_guess == true
    game.num_incorrect_guesses(guessarr)
    game.remaining_incorrect_guesses(incorrect_guesses)
  end

  if incorrect_guesses == INIT_NUM_WRONG
    puts "==> You've lost. Great game!"
   # break
  #elsif dashstr == word
    puts "==> You've Won!"
    break
  end

end