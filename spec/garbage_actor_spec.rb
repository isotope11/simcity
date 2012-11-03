require 'spec_helper'

describe Actor::Garbage do
  before do
    @map = mock "map"
    @actor = Actor::Garbage.new(@map)
  end

  it "offers garbage" do
    @actor.offer?(:garbage).should be_true
  end

  it "doesn't offer water" do
    @actor.offer?(:water).should be_false
  end
end
