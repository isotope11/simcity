require 'spec_helper'

describe WaterPump do
  before do
    @map = mock 'map'
    @water_pump = WaterPump.new(@map)
  end

  it "has a resource_rate" do
    @water_pump.resource_rate.should == 1
  end

  it "can generate a WaterActor" do
    @water_pump.generate_water.should be_a(Actor::Water)
  end

  it "injects a WaterActor into the map to the north each tick" do
    @map.stub(:point_for_object).and_return(Map::Point.new(2,2))
    fake_cell = mock 'fake cell'
    fake_road = mock "fake road"

    map_cell_north = mock "map_cell_north"
    map_cell_south = mock "map_cell_south"
    map_cell_east = mock "map_cell_east"
    map_cell_west = mock "map_cell_west"
    [map_cell_north, map_cell_south, map_cell_east].each { |obj| obj.should_receive(:keys).and_return([]) }
    map_cell_west.should_receive(:keys).exactly(1).times.and_return([Structure::Road])
    map_cell_west.should_receive(:[]).exactly(1).times.with(Structure::Road).and_return([fake_road])

    @map.should_receive(:cell_for_object).with(fake_road).and_return(fake_cell)
    point = @water_pump.point.north
    @map.stub(:cell_at).with(point).and_return(fake_cell)
    @map.stub(:neighbors_for_object).with(@water_pump).and_return([map_cell_north, map_cell_south, map_cell_east, map_cell_west])
    water_actor = mock
    @water_pump.stub(:generate_water).and_return(water_actor)
    fake_cell.should_receive(:<<).with(water_actor)
    @water_pump.tick
  end
end
