Given /^there is a (\w+) cell$/ do |cell_status|
  @cell_status = cell_status.to_sym
end

Given /^there are (\d+) neighbours$/ do |neighbours_count|
  @live_neighbours = neighbours_count.to_i
end

When /^the cell is evolved$/ do
  @cell_status = GameEvolutionRule.new.calculate_status(:status => @cell_status, :neighbours => @live_neighbours)
end

Then /^the cell should be (\w+)$/ do |cell_status|
  @cell_status.should == cell_status.to_sym
end
