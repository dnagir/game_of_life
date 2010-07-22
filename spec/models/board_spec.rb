require File.expand_path("../../spec_helper", __FILE__)

describe GameBoard do
  it 'should have correct size' do
    board = GameBoard.new(:width => 3, :height => 4)
    board.width.should == 3
    board.height.should == 4
  end
  
  it 'can be created from matrix' do
    # 2x3
    board = GameBoard.new( :state => [[1,1], [0,0], [1,0]])
    board.width.should == 2
    board.height.should == 3    
    board[0,0].should == :live
    board[1,2].should == :dead
  end
  
  it 'can be created from string matrix' do
    # 2x3
    board = GameBoard.new( :state => [['x','x'], ['',''], ['x','']])
    board.width.should == 2
    board.height.should == 3
    board[0,0].should == :live
    board[1,2].should == :dead
  end
  
  it 'should return all living cells' do
   GameBoard.new( :state => [[1,0], [0,1]]).live_cells.
    should == [[0,0], [1,1]]
  end
  
  it "should be able to compare same boards" do
    GameBoard.new(:width => 3, :height => 4).should == GameBoard.new(:width => 3, :height => 4)
    GameBoard.new(:width => 2, :height => 2).should_not == GameBoard.new(:width => 3, :height => 4)
    GameBoard.new(:state => [[1]]).should eql( GameBoard.new(:state => [[1]]) )
  end  
end



describe GameBoard, "counting neighbours" do
  before do
    @board = GameBoard.new(:state => [
      [1,0,0],
      [1,1,0],
      [0,0,0]
    ])
  end
  
  def at(x,y)
    @board.neighbours_count_from([x,y])
  end

  it "should calculate neighbours count" do
    at(0,0).should == 2
    at(2,0).should == 3
    at(1,1).should == 2   
    at(2,2).should == 3
  end
end


describe GameBoard, "moving" do
  before do
    @board = GameBoard.new(:width=> 3, :height=>3)
  end
  
  it "north" do    
    @board.north_cell([1,1]).should == [1,0]
    @board.north_cell([1,0]).should == [1,2]
    @board.north_cell([0,0]).should == [0,2]
  end
  
  it "south" do
    @board.south_cell([1,1]).should == [1,2]
    @board.south_cell([1,2]).should == [1,0]
  end
  
  it "east" do
    @board.east_cell([1,1]).should == [2,1]
    @board.east_cell([2,1]).should == [0,1]
  end
  
  it "west" do
    @board.west_cell([1,1]).should == [0,1]
    @board.west_cell([0,1]).should == [2,1]
  end
  
end
