require 'spec_helper'

describe Map::Point do
  before do
    @point = Map::Point.new(1, 2)
  end

  it 'has an x and a y' do
    @point.x.should == 1
    @point.y.should == 2
  end

  describe 'neighboring points' do
    it 'translates north' do
      @point.north.should == Map::Point.new(1, 1)
    end
    it 'translates south' do
      @point.south.should == Map::Point.new(1, 3)
    end
    it 'translates east' do
      @point.east.should == Map::Point.new(2, 2)
    end
    it 'translates west' do
      @point.west.should == Map::Point.new(0, 2)
    end
  end
end
