require File.expand_path("../game_evolution_rule", __FILE__)
require File.expand_path("../game_board", __FILE__)

class GameOfLife
  def initialize(board)
    board = GameBoard.new(:width=>board, :height=>board) if board.respond_to?('odd?')
    @board = board
    setup_cells
  end
  
  def setup_cells
    (1..(@board.width * @board.height) / 2).each do
      begin
        x,y = rand(@board.width), rand(@board.height)
      end while @board[x,y] == 1
      @board[x,y] = 1
    end
  end
  
  def board
    @board
  end
  
  def state
    @board.state
  end
  
  def state=(new_state)
    @board = GameBoard.new(:state => new_state)
  end
  
  def evolve
    rule = GameEvolutionRule.new
    next_board = GameBoard.new(:width => @board.width, :height => @board.height)
    
    next_board.set_cells do |x,y|
      current_status = @board[x,y]
      rule.calculate_status :status => current_status, :neighbours => @board.neighbours_count_from([x,y])      
    end
    @board = next_board
    @board.state
  end
end

