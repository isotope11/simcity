require 'spec_helper'
describe  House do
  before do
    @map = mock 'map'
    @house = House.new(@map)
    @north_cell = mock "north_cell"
    @south_cell = mock "south_cell"
    @east_cell = mock "east_cell"
    @west_cell = mock "west_cell"
  end

  it "isn't powered before a tick" do
    @house.powered?.should be_false
  end

  it "isn't powered after a tick if there is no power" do
    @north_cell.should_receive(:detect)
    @south_cell.should_receive(:detect)
    @east_cell.should_receive(:detect)
    @west_cell.should_receive(:detect)

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @house.tick
    @house.powered?.should be_false
  end

  it "is powered if there is a power actor nearby" do
    @power = mock "power"
    @north_cell.should_receive(:detect).and_return(@power)

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @map.should_receive(:cell_for_object).with(@power).and_return(@north_cell)
    @north_cell.should_receive(:delete).with(@power)
    @house.tick
    @house.powered?.should be_true
  end

  it "should lose power after being powered when there is no power" do
    @house.powered = true
    @house.powered?.should be_true

    @north_cell.should_receive(:detect)
    @south_cell.should_receive(:detect)
    @east_cell.should_receive(:detect)
    @west_cell.should_receive(:detect)

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @house.tick
    @house.powered?.should be_false
  end
end
