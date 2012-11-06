require 'spec_helper'
describe House do
  before do
    @map = mock 'map'
    @house = House.new(@map)
    @north_cell = mock "north_cell"
    @south_cell = mock "south_cell"
    @east_cell = mock "east_cell"
    @west_cell = mock "west_cell"
  end

  it "should consume water and power on tick" do
    @house.should_receive(:consume_power).exactly(1).times
    @house.should_receive(:consume_water).exactly(1).times
    @house.should_receive(:produce_garbage).exactly(1).times
    @house.tick
  end

  it "produces garbage on the nearest road" do
    fake_road = mock "fake_road"

    map_cell_north = mock "map_cell_north"
    map_cell_south = mock "map_cell_south"
    map_cell_east = mock "map_cell_east"
    map_cell_west = mock "map_cell_west"
    map_cell_north.should_receive(:keys).and_return([Structure::Road])
    map_cell_north.should_receive(:[]).with(Structure::Road).and_return([fake_road])
    @map.should_receive(:neighbors_for_object).with(@house).and_return([map_cell_north, map_cell_south, map_cell_east, map_cell_west])

    map_cell_north.should_receive(:<<).with(kind_of(Actor::Garbage))
    @map.should_receive(:cell_for_object).with(fake_road).and_return(map_cell_north)
    @house.produce_garbage
  end

  it "isn't watered before a tick" do
    @house.watered?.should be_false
  end

  it "isn't watered after consuming water if there is no water" do
    [@north_cell, @south_cell, @east_cell, @west_cell].each { |cell| cell.should_receive(:keys).exactly(1).times.and_return([]) }

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @house.consume_water
    @house.watered?.should be_false
  end

  it "is watered after consuming water if there is a water actor nearby" do
    @water = mock "water"
    @north_cell.should_receive(:keys).and_return([Actor::Water])
    @north_cell.should_receive(:[]).with(Actor::Water).and_return([@water])

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @map.should_receive(:cell_for_object).with(@water).and_return(@north_cell)
    @north_cell.should_receive(:delete).with(@water)
    @house.consume_water
    @house.watered?.should be_true
  end

  it "should lose water after being watered when there is no water" do
    @house.watered = true
    @house.watered?.should be_true

    [@north_cell, @south_cell, @east_cell, @west_cell].each { |cell| cell.should_receive(:keys).and_return([]) }

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @house.consume_water
    @house.watered?.should be_false
  end

  it "isn't powered before a tick" do
    @house.powered?.should be_false
  end

  it "isn't powered after consuming power if there is no power" do
    [@north_cell, @south_cell, @east_cell, @west_cell].each { |cell| cell.should_receive(:keys).exactly(1).times.and_return([]) }

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @house.consume_power
    @house.powered?.should be_false
  end

  it "is powered after consuming power if there is a power actor nearby" do
    @power = mock "power"
    @north_cell.should_receive(:keys).and_return([Actor::Power])
    @north_cell.should_receive(:[]).with(Actor::Power).and_return([@power])

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @map.should_receive(:cell_for_object).with(@power).and_return(@north_cell)
    @north_cell.should_receive(:delete).with(@power)
    @house.consume_power
    @house.powered?.should be_true
  end

  it "should lose power after being powered when there is no power" do
    @house.powered = true
    @house.powered?.should be_true

    [@north_cell, @south_cell, @east_cell, @west_cell].each { |cell| cell.should_receive(:keys).exactly(1).times.and_return([]) }

    @map.should_receive(:neighbors_for_object).with(@house).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @house.consume_power
    @house.powered?.should be_false
  end
end
