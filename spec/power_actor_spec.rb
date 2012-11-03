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

  it "moves north on tick" do
    map_cell = mock "map_cell"
    other_map_cell = mock "other_map_cell"
    point = Map::Point.new(1,1)
    map_cell.should_receive(:point).and_return(point)
    map_cell.should_receive(:delete).with(@actor)
    other_map_cell.should_receive(:<<).with(@actor)
    @map.should_receive(:cell_at).with(Map::Point.new(1,0)).and_return(other_map_cell)
    @map.should_receive(:cell_for_object).and_return(map_cell)
    @actor.tick
  end
end
