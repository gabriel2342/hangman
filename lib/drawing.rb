module HangmanDrawing
  def guess_0
    top
    head
    arms_and_hands
    body
    legs_and_feet
    bottom
  end

  def guess_1
    top
    head
    arms_and_hands
    body
    legs_two
    bottom
  end
  
  def guess_2
    top
    head
    arms_and_hands
    body
    legs_one
    bottom
  end

  def guess_3
    top
    head
    arms_and_hands
    body
    stand_piece
    bottom
  end

  def guess_4
    top
    head
    arms_and_hands
    stand_piece
    stand_piece
    bottom
  end

  def guess_5
    top
    head
    arms_two
    stand_piece
    stand_piece
    bottom
  end

  def guess_6
    top
    head
    arms_one
    stand_piece
    stand_piece
    bottom
  end

  def guess_7
    top
    head
    stand_piece
    stand_piece
    stand_piece
    bottom
  end

  def guess_8
    top
    stand_piece
    stand_piece
    stand_piece
    stand_piece
    bottom
  end

  def current_hangman(n)
    if n == 1
      guess_1
    elsif n == 2
      guess_2
    elsif n == 3
      guess_3
    elsif n == 4
      guess_4
    elsif n == 5
      guess_5
    elsif n == 6
      guess_6
    elsif n == 7
      guess_7
    elsif n == 8
      guess_8
    else             
      guess_0
    end
  end
end