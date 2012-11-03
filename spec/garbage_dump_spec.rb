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

  it "should consume water and power on tick" do
    @garbage_dump.should_receive(:consume_garbage).exactly(1).times
    @garbage_dump.tick
  end
end
