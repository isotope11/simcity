require 'spec_helper'

describe Actor::Power do
  before do
    @map = mock "map"
    @actor = Actor::Power.new(@map)
  end

  it "offers power" do
    @actor.offer?(:power).should be_true
  end

  it "doesn't offer water" do
    @actor.offer?(:water).should be_false
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
