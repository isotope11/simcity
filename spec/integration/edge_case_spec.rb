require 'spec_helper'

describe "Edge cases" do
  before do
    @map = Map.new(10, 10)
  end
  it "can handle a house with water and power pumped into it" do
    @map.cell_at(Map::Point.new(5, 5)) << House.new(@map)
    @map.cell_at(Map::Point.new(5, 6)) << Structure::Road.new(@map)
    @map.cell_at(Map::Point.new(5, 7)) << PowerPlant.new(@map)
    @map.tick
    @map.tick
  end
  it "can handle a power plant on the far right border" do
    @map.cell_at(Map::Point.new(9, 9)) << PowerPlant.new(@map)
    @map.tick
  end
  it "allows a house to consume water to its left" do
    house = House.new(@map)
    @map.cell_at(Map::Point.new(4, 8)) << house
    @map.tick
    house.should_not be_watered
    @map.cell_at(Map::Point.new(3, 8)) << Structure::Road.new(@map)
    @map.cell_at(Map::Point.new(3, 9)) << WaterPump.new(@map)
    @map.tick
    @map.tick
    house.should be_watered
  end
end
