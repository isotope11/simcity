require 'spec_helper'

describe PowerPlant do
  before do
    @map = mock 'map'
    @power_plant = PowerPlant.new(@map)
  end

  it "has a resource_rate" do
    @power_plant.resource_rate.should == 1
  end

  it "can generate a PowerActor" do
    @power_plant.generate_power.should be_a(Actor::Power)
  end

  it "injects a PowerActor into the map to the north each tick" do
    @map.stub(:point_for_object).and_return(Map::Point.new(2,2))
    fake_cell = mock 'fake cell'
    fake_road = mock "fake road"
    map_cell_north = mock "map_cell_north"
    map_cell_south = mock "map_cell_south"
    map_cell_east = mock "map_cell_east"
    map_cell_west = mock "map_cell_west"
    map_cell_north.should_receive(:detect).and_return(nil)
    map_cell_south.should_receive(:detect).and_return(nil)
    map_cell_east.should_receive(:detect).and_return(nil)
    map_cell_west.should_receive(:detect).exactly(2).times.and_return(fake_road)
    @map.should_receive(:cell_for_object).with(fake_road).and_return(fake_cell)
    point = @power_plant.point.north
    @map.stub(:cell_at).with(point).and_return(fake_cell)
    @map.stub(:neighbors_for_object).with(@power_plant).and_return([map_cell_north, map_cell_south, map_cell_east, map_cell_west])
    power_actor = mock
    @power_plant.stub(:generate_power).and_return(power_actor)
    fake_cell.should_receive(:<<).with(power_actor)
    @power_plant.tick
  end
end
