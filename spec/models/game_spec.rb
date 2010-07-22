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
  
  it "can be initialized with board" do
    board = GameBoard.new(:width => 2, :height => 2)
    GameOfLife.new(board).board.should == board
  end  
  
end



describe GameOfLife do
  before do
    @game = GameOfLife.new(3)
  end

  it 'should be initialized with living cells' do
    @game.board.live_cells.should_not be_empty
  end  
  
  it 'evolving replaces the board' do
    previous_board = @game.board
    @game.evolve
    @game.state.should_not equal previous_board
  end
  
  it 'evolving returns the board' do
    @game.evolve.should == @game.state
  end
  
  it 'can replace the board' do
    previous_board = @game.board
    @game.state = [[1]]
    @game.board.should_not equal previous_board
  end
end

