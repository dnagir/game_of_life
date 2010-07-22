Given /^there is a board (\d+)x(\d+)$/ do |width, height|
  @board = GameBoard.new(:width => width.to_i, :height => height.to_i)
end

Given /^starting at position (\d+)x(\d+)$/ do |x, y|
  @position = [x.to_i - 1, y.to_i - 1];
end

When /^move (\w+-?\w*) (\d+) times$/ do |direction, steps_count|
  direction = direction.gsub(/-/, '_').to_sym
  @position = (1..steps_count.to_i).inject(@position) { |pos, step_number| 
    @board.position_from(pos, direction) 
  }
end

Then /^current position should be (\d+)x(\d+)$/ do |x, y|
  expected = [x.to_i - 1, y.to_i - 1]
  @position.should == expected
end


When /^the game is initialised$/ do  
  @game = GameOfLife.new(@board ? @board : 3)
  @board = @game.board
end

Then /^the board should have living cells$/ do
  @board.live_cells.should_not be_empty
end

Then /^cell at (\d+)x(\d+) should have (\d+) neighbours$/ do |x, y, neighbours|
  @board.neighbours_count_from([x.to_i - 1, y.to_i - 1]).should == neighbours.to_i
end

