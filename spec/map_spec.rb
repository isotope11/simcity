require 'spec_helper'

describe Map do

  describe "boundaries" do
    it "defaults to 100 x 100 grid" do
      map = Map.new
      map.width.should == 100
      map.height.should == 100
    end

    it "lets your specify your own grid" do
      map = Map.new(10,15)
      map.width.should == 10
      map.height.should == 15
    end

    it "returns a grid with those dimensions" do
      map = Map.new(100, 100)
      grid = map.grid
      grid.count.should == 100
      grid.each do |line|
        line.count.should == 100
      end
    end
  end
end
