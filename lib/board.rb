class Board
  attr_accessor :cells

  def input_to_index(input)
    return input.to_i - 1
  end
  
  def initialize
    reset!
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  
  def position(input)
    @cells[input_to_index(input)]
  end
  
  def full?
    turn_count == 9
  end 

  def taken?(input)
    !(@cells[input_to_index(input)] == " " || @cells[input_to_index(input)] == "")
  end
  
  def valid_move?(input) 
    input_to_index(input)>=0 && input_to_index(input)<9 && !taken?(input)
  end

  def turn_count
    empty_spaces = @cells.count do | entry | 
      (entry == " " || entry == "")
    end
    return 9-empty_spaces
  end
  
  def update(input, player)
    @cells[input_to_index(input)] = player.token
  end 
end
