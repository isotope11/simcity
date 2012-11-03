require 'spec_helper'

describe Actor::DieingResource do
  before do
    @map = mock "map"
    @actor = Actor::DieingResource.new(@map)
  end

  it "deletes itself if there is no road" do
    other_fake_cell = mock 'other fake cell'

    map_cell_north = mock "map_cell_north"
    map_cell_south = mock "map_cell_south"
    map_cell_east = mock "map_cell_east"
    map_cell_west = mock "map_cell_west"
    [map_cell_north, map_cell_south, map_cell_east, map_cell_west].each { |obj| obj.should_receive(:detect).and_return(nil) }
    @map.should_receive(:neighbors_for_object).with(@actor).and_return([map_cell_north, map_cell_south, map_cell_east, map_cell_west])
    @map.should_receive(:cell_for_object).with(@actor).and_return(other_fake_cell)
    other_fake_cell.should_receive(:delete).with(@actor)
    @actor.tick
  end
end
