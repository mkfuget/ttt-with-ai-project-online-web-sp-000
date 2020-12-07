class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end 
end 

module Players
  class Human < Player
    def move(board)
      input = gets.chomp
      return input
    end 
  end 
end