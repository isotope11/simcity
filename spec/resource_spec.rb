require 'spec_helper'

describe Actor::Resource do
  before do
    @map = mock "map"
    @actor = Actor::Resource.new(@map)
  end

  it "moves to an adjacent road if available on tick" do
    fake_cell = mock 'fake cell'
    other_fake_cell = mock 'other fake cell'
    fake_road = mock "fake road"

    map_cell_north = mock "map_cell_north"
    map_cell_south = mock "map_cell_south"
    map_cell_east = mock "map_cell_east"
    map_cell_west = mock "map_cell_west"
    [map_cell_north, map_cell_south, map_cell_east].each { |obj| obj.should_receive(:detect).and_return(nil) }
    map_cell_west.should_receive(:detect).exactly(1).times.and_return(fake_road)
    @map.should_receive(:neighbors_for_object).with(@actor).and_return([map_cell_north, map_cell_south, map_cell_east, map_cell_west])
    @map.should_receive(:cell_for_object).with(fake_road).and_return(fake_cell)
    @map.should_receive(:cell_for_object).with(@actor).and_return(other_fake_cell)
    other_fake_cell.should_receive(:delete).with(@actor)
    fake_cell.should_receive(:<<).with(@actor)
    @actor.tick
  end

  it "won't even consider going into the cell it was last in" do
    current_cell = mock 'current_cell'

    map_cell_north = mock "map_cell_north"
    map_cell_south = mock "map_cell_south"
    map_cell_east = mock "map_cell_east"
    map_cell_west = mock "map_cell_west"
    fake_road = mock "fake road"
    [map_cell_north, map_cell_south, map_cell_east].each { |obj| obj.should_receive(:detect).and_return(nil) }
    @map.should_receive(:neighbors_for_object).with(@actor).and_return([map_cell_north, map_cell_south, map_cell_east, map_cell_west])
    @map.should_receive(:cell_for_object).with(@actor).and_return(current_cell)
    @actor.last_cell = map_cell_west
    @actor.tick
  end
end
