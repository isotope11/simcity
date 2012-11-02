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

  describe "getting a MapCell at coordinates" do
    it "returns the appropriate MapCell" do
      map = Map.new
      map.cell_at(Map::Point.new(2, 3)).should be_a MapCell
    end
  end

  describe "internal knowledge" do
    before do
      @map = Map.new
      @point = Map::Point.new(1,1)
      @cell = @map.cell_at(@point)
      @object = mock
      @cell << @object
    end
    it "knows the row a given object is in" do
      @map.row_for_object(@object).should == @map.grid[1]
    end

    it "knows the cell a given object is in" do
      @map.cell_for_object(@object).should == @cell
    end

    it "knows the point a given cell is at" do
      @map.point_for_cell(@cell).should == Map::Point.new(1, 1)
    end

  end
end
