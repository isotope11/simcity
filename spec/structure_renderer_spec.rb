require 'spec_helper'

describe Renderer::Structure do
  before do
    @renderer = Renderer::Structure.new
  end

  it "renders itself as an S" do
    @renderer.to_s.should == 'S'
  end
end
