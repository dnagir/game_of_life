
Given /^the board$/ do |table|
  # table is a Cucumber::Ast::Table
  @board = GameBoard.new(:state => table.raw)
end

When /^the generation passes$/ do
  @game.evolve
  @board = @game.board
end

Then /^the board should be$/ do |table|
  @board.should == GameBoard.new(:state => table.raw)
end

