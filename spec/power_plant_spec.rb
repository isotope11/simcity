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
    point = @power_plant.point.north
    fake_cell = mock 'fake cell'
    @map.stub(:cell_at).with(point).and_return(fake_cell)
    power_actor = mock
    @power_plant.stub(:generate_power).and_return(power_actor)
    fake_cell.should_receive(:<<).with(power_actor)
    @power_plant.tick
  end
end
