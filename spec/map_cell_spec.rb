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
    [:north, :south, :east].map do |sym|
      @map.should_receive(:cell_at).with(@cell.point.send(sym)).and_return(fake_cell)
    end
    @map.should_receive(:cell_at).with(@cell.point.send(:west)).and_return(nil)
    @cell.neighbors.should == [fake_cell, fake_cell, fake_cell]
  end

  it "knows how to tick" do
    fake_thing_1 = mock "fake_thing_1"
    fake_thing_2 = mock "fake_thing_2"
    fake_thing_1.should_receive(:tick)
    fake_thing_2.should_receive(:tick)
    @cell << fake_thing_1
    @cell << fake_thing_2
    @cell.tick
  end
end
