require File.expand_path("../../spec_helper", __FILE__)

describe GameOfLife, "initialization" do

  it "can be initialized with the board" do
    board = GameBoard.new(:width => 2, :height => 3)
    game = GameOfLife.new(board)
    game.board.should == board
  end
  
  it "can be initialized with board size" do
    game = GameOfLife.new(3)    
    game.board.width.should == 3
    game.board.height.should == 3
  end
  
end



describe GameOfLife do
  before do
    @board = GameBoard.new(:width => 2, :height => 3)
    @game = GameOfLife.new(@board)
  end

  it 'should be initialized with living cells' do    
    @board.live_cells.should_not be_empty
  end  
  
  it 'evolving replaces the board' do    
    @game.evolve
    @game.state.should_not == @board.state
  end
  
  it 'evolving returns the board' do
    @game.evolve.should == @game.state
  end
  
  it 'can replace the board' do
    @game.state = [[1]]
    @game.board.should_not == @board
  end
end

