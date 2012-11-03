require 'spec_helper'

describe Actor::Water do
  it "should have a resource type" do
    water_actor = Actor::Water.new(mock)
    water_actor.resource_type.should == :water
  end
end
