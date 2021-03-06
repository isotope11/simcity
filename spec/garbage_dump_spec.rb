require 'spec_helper'
describe GarbageDump do
  before do
    @map = mock 'map'
    @garbage_dump = GarbageDump.new(@map)
    @north_cell = mock "north_cell"
    @south_cell = mock "south_cell"
    @east_cell = mock "east_cell"
    @west_cell = mock "west_cell"
  end

  it "should consume garbage on tick" do
    @garbage_dump.should_receive(:consume_garbage).exactly(1).times
    @garbage_dump.tick
  end

  it "consumes garbage if it is nearby" do
    @garbage = mock "garbage"
    @north_cell.should_receive(:keys).exactly(2).times.and_return([Actor::Garbage])
    [@north_cell, @south_cell, @east_cell, @west_cell].each {|cell| cell.should_receive(:keys).exactly(1).times.and_return([]) }
    @north_cell.should_receive(:[]).exactly(2).times.with(Actor::Garbage).and_return([@garbage])

    @map.should_receive(:neighbors_for_object).with(@garbage_dump).and_return([@north_cell, @south_cell, @east_cell, @west_cell])
    @map.should_receive(:cell_for_object).exactly(2).times.with(@garbage).and_return(@north_cell)
    @north_cell.should_receive(:delete).exactly(2).times.with(@garbage)
    @garbage_dump.consume_garbage(3)
  end
end
