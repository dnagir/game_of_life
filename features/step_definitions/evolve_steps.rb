
Given /^the board$/ do |table|
  # table is a Cucumber::Ast::Table
  @board = GameBoard.new(:state => table.raw)
end

When /^the generation passes$/ do
  @game.evolve
end

Then /^the board should be$/ do |table|
  expected = table.raw
  @board.should == GameBoard.new(:state => expected)
end

