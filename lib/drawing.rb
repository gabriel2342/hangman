# frozen_string_literal: true

# draws our hagman for us
module HangmanDrawing
  def second_stand_piece(das)
    puts "    |                       #{das}"
  end

  def body(das)
    puts "    |        |              #{das}"
    puts '    |        |'
  end

  def guess_init
    puts "\t\t\t    __________"
    puts "\t\t\t    |/       |"
    puts "\t\t\t    |       (_)"
    puts "\t\t\t    |     o__|__o"
    puts "\t\t\t    |        |"
    puts "\t\t\t    |        |"
    puts "\t\t\t    |      _/ \\_ "
    puts "\t\t\t    |"
    puts "\t\t\t    |\\___"
  end

  def guess_zero(body_dash)
    top
    head
    arms_and_hands
    body(body_dash)
    legs_and_feet
    bottom
  end

  def guess_one(body_dash)
    top
    head
    arms_and_hands
    body(body_dash)
    legs_two
    bottom
  end

  def guess_two(body_dash)
    top
    head
    arms_and_hands
    body(body_dash)
    legs_one
    bottom
  end

  def guess_three(body_dash)
    top
    head
    arms_and_hands
    body(body_dash)
    stand_piece
    bottom
  end

  def guess_four(body_dash)
    top
    head
    arms_and_hands
    second_stand_piece(body_dash)
    stand_piece
    bottom
  end

  def guess_five(body_dash)
    top
    head
    arms_two
    second_stand_piece(body_dash)
    stand_piece
    bottom
  end

  def guess_six(body_dash)
    top
    head
    arms_one
    second_stand_piece(body_dash)
    stand_piece
    bottom
  end

  def guess_seven(body_dash)
    top
    head
    stand_piece
    second_stand_piece(body_dash)
    stand_piece
    bottom
  end

  def guess_eight(body_dash)
    top
    stand_piece
    stand_piece
    second_stand_piece(body_dash)
    stand_piece
    bottom
  end

  def display_current_hangman(num, string)
    case num
    when 1
      guess_one(string)
    when 2
      guess_two(string)
    when 3
      guess_three(string)
    when 4
      guess_four(string)
    when 5
      guess_five(string)
    when 6
      guess_six(string)
    when 7
      guess_seven(string)
    when 8
      guess_eight(string)
    else
      guess_zero(string)
    end
  end
end
