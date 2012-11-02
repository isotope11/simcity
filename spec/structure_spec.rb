require 'spec_helper'
describe Structure do
  it "is instantiated with a map" do
    map = mock "map"
    structure = Structure.new(map)
  end

  it "knows its neighbors" do
    map = mock "map"
    structure = Structure.new(map)
    map.should_receive(:neighbors_for_object).with(structure).and_return []
    structure.neighbors
  end
end
