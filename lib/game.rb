class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  def current_player 
    return board.turn_count%2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      win_index_0 = combination[0]
      win_index_1 = combination[1]
      win_index_2 = combination[2]
      
      if(@board.cells[win_index_0] == @player_1.token && @board.cells[win_index_1] == @player_1.token && @board.cells[win_index_2] == @player_1.token)
        return combination
      end  
      if(@board.cells[win_index_0] == @player_2.token && @board.cells[win_index_1] == @player_2.token && @board.cells[win_index_2] == @player_2.token)
        return combination
      end
    end
    return false
  end  

  def draw?
    if(over? && !won?)
      return true 
    end 
    return false 
  end
  
  def over?
    return @board.full? || won?
  end

  def winner
    if(draw? || !over?)
      return nil 
    else 
      return @board.cells[won?[0]]
    end 
  end 
  
  def turn
    loop do 
      move = current_player.move(@board)
      if(@board.valid_move?(move))
        board.update(move, current_player)        
        break
      end
      puts "invalid"
    end
  end
  
  def play 
    loop do
      puts "Player #{current_player.token} it's your move"
      turn 
      @board.display
      if(over?)
        break
      end
    end
  end

end
