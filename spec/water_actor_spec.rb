require 'spec_helper'

describe Actor::Water do
  before do
    @water_actor = Actor::Water.new(mock)
  end

  it "should have a resource type" do
    @water_actor.resource_type.should == :water
  end

  it "offers water" do
    @water_actor.offer?(:water).should be_true
  end
end
