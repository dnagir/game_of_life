Given /^there is a board (\d+)x(\d+)$/ do |width, height|
  @board = GameBoard.new(width.to_i, height.to_i)
end

Given /^starting at position (\d+)x(\d+)$/ do |x, y|
  @position = [x.to_i, y.to_i];
end

When /^move (\w+) (\d+) times$/ do |direction, steps_count|
  direction = direction.gsub(/-/, '_').to_sym
  @position = (1..steps_count.to_i).inject(@position) { |pos, step_number| 
    @board.position_from(pos, direction) 
  }
end

Then /^current position should be (\d+)x(\d+)$/ do |x, y|
  expected = [x.to_i, y.to_i]
  @position.should == expected
end


When /^the game is initialised$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the board should have living cells$/ do
  pending # express the regexp above with the code you wish you had
end

