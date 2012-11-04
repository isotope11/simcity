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
end
