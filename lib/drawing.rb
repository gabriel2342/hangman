module HangmanDrawing

  def guess_init
    top
    head
    arms_and_hands
    puts "    |        |"
    puts "    |        |"
    legs_and_feet
    bottom
  end
  def guess_0(dashe)
    top
    head
    arms_and_hands
    body(dashe)
    legs_and_feet
    bottom
  end

  def guess_1(dashe)
    top
    head
    arms_and_hands
    body(dashe)
    legs_two
    bottom
  end
  
  def guess_2(dashse)
    top
    head
    arms_and_hands
    body(dashe)
    legs_one
    bottom
  end

  def guess_3(dashe)
    top
    head
    arms_and_hands
    body(dashe)
    stand_piece
    bottom
  end

  def guess_4(dashe)
    top
    head
    arms_and_hands
    second_stand_piece(dashe)
    stand_piece
    bottom
  end

  def guess_5(dashe)
    top
    head
    arms_two
    second_stand_piece(dashe)
    stand_piece
    bottom
  end

  def guess_6(dashe)
    top
    head
    arms_one
    second_stand_piece(dashe)
    stand_piece
    bottom
  end

  def guess_7(dashe)
    top
    head
    stand_piece
    second_stand_piece(dashe)
    stand_piece
    bottom
  end

  def guess_8(dashe)
    top
    stand_piece
    stand_piece
    second_stand_piece(dashe)
    stand_piece
    bottom
  end

  def current_hangman(n, string)
    if n == 1
      guess_1(string)
    elsif n == 2
      guess_2(string)
    elsif n == 3
      guess_3(string)
    elsif n == 4
      guess_4(string)
    elsif n == 5
      guess_5(string)
    elsif n == 6
      guess_6(string)
    elsif n == 7
      guess_7(string)
    elsif n == 8
      guess_8(string)
    else             
      guess_0(string)
    end
  end
end