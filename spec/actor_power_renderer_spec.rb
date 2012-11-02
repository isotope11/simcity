require 'spec_helper'

describe Renderer::Actor::Power do
  before do
    @renderer = Renderer::Actor::Power.new
  end

  it "renders itself as a lightning bolt" do
    @renderer.to_s.should == "z"
  end
end
