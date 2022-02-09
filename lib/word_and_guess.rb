
class CompWordPlayerGuess

  attr_accessor :comp_word, :guess

  def initialize
    @@guess = nil
  end

  def open_words_file
    File.open('google-10000-english-no-swears.txt')
  end
  
  def google_words_list
    open_words_file.readlines.map(&:chomp)
  end

  def choose_game_word
    @@comp_word =  google_words_list.sample 
    validate_game_word
  end

  def validate_game_word
    until @@comp_word.size >=5 && @@comp_word.size <= 10   
      choose_game_word
    end
  end

  def word_size
    @@comp_word.size
  end

  def word_array
    @@comp_word.chars
  end
  
  def new_word
    @@comp_word
  end

  def player_guess
    display_player_guess
    @@guess = gets.chomp.downcase
  end

  def guess_correct?
    p "test"
    @@comp_word.include?(@@guess)
  end

  def replace_dashes(dashh)
    word_array.each_with_index do |char,i|
      if char == @@guess
        dashh.delete_at(i)
        dashh.insert(i, char)
      end
    end
   dashh.join('')
  end

end