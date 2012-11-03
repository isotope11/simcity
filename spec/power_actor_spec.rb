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
end
