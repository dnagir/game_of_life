

class GameCell
  def initialize(board)
    @board = board
  end
  
  def living_neighbours_count
    0
  end
  
  def status
    :alive
  end
end

class GameBoard < Array
  def position_from(me, direction)
    [1,1]
  end
end

class GameOfLife
  def initialize(width, height = width, cells = width)    
  end
  
  def state=(board)
    [[1]]    
  end
  
  def evolve
  end
end

