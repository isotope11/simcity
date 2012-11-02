require 'spec_helper'

describe MapCell do
  before do
    @map = mock
    @cell = MapCell.new(@map)
  end

  it 'can have stuff added to it' do
    object = mock
    @cell << object
    @cell.include?(object).should be_true
  end

  it "knows its neighbors" do
    fake_cell = mock
    @map.stub(:point_for_cell).and_return(Map::Point.new(2, 2))
    [:north, :south, :east, :west].map do |sym|
      @map.should_receive(:cell_at).with(@cell.point.send(sym)).and_return(fake_cell)
    end
    @cell.neighbors.should == [fake_cell, fake_cell, fake_cell, fake_cell]
  end
end
