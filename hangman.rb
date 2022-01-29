

class Hangman
  def initialize
    @words = File.open("google-10000-english-no-swears.txt")
    @words_list = @words.readlines.map(&:chomp)
  end

  def new_word
      @words_list.sample 
  end
end
game = Hangman.new
word = game.new_word
until word.size >=5 && word.size <=10
  word = game.new_word
end
p word


