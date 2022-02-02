module HangmanDrawing

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

  

  def guess_8
    top
    head
    arms_and_hands
    body
    legs_and_feet
    bottom
  end

  def guess_7
    top
    head
    arms_and_hands
    body
    legs_two
    bottom
  end
  
  def guess_6
    top
    head
    arms_and_hands
    body
    legs_one
    bottom
  end

  def guess_6
    top
    head
    arms_and_hands
    body
    stand_piece
    bottom
  end

  def guess_5
    top
    head
    arms_and_hands
    stand_piece
    stand_piece
    bottom
  end

  def guess_4
    top
    head
    arms_two
    stand_piece
    stand_piece
    bottom
  end

  def guess_3
    top
    head
    arms_one
    stand_piece
    stand_piece
    bottom
  end

  def guess_2
    top
    head
    stand_piece
    stand_piece
    stand_piece
    bottom
  end

  def just_the_stand
    top
    3.times {stand_piece}
    bottom
  end

  def current_hangman(n)
    p n
    if n == 1
      guess_8
    elsif n == 2
      guess_7
    elsif n == 3
      guess_6
    elsif n == 4
      guess_5
    elsif n == 5
      guess_4
    elsif n == 6
      guess_3
    elsif n == 7
      guess_2
    else             
      just_the_stand
    end
  end
end