require File.expand_path("../../spec_helper", __FILE__)

describe GameEvolutionRule do
  before do
    @rule = GameEvolutionRule.new
  end
  
  def status(cell_status, neighbours)
    @rule.calculate_status(:status => cell_status, :neighbours => neighbours)
  end
  
  it 'should survive' do
    status(:live, 2).should == :live
    status(:live, 3).should == :live
  end
  
  it 'should die' do
    status(:live, 0).should == :dead
    status(:live, 1).should == :dead
    status(:live, 4).should == :dead
    status(:live, 5).should == :dead
    status(:live, 6).should == :dead
    status(:live, 7).should == :dead
    status(:live, 8).should == :dead
  end
  
  it 'should resurrect' do
    status(:dead, 3).should == :live
  end
  
  it "should not resurrect" do
    status(:dead, 0).should == :dead
    status(:dead, 1).should == :dead
    status(:dead, 2).should == :dead
    status(:dead, 4).should == :dead
    status(:dead, 5).should == :dead
    status(:dead, 6).should == :dead
    status(:dead, 7).should == :dead
    status(:dead, 8).should == :dead
  end
end
