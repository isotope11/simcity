require 'spec_helper'

describe Renderer::MapCell do
  before do
    @cell = mock 'cell'
    @renderer = Renderer::MapCell.new(@cell)
  end

  it "renders itself as a dot if nothing in the cell" do
    @cell.stub(:empty?).and_return true
    @renderer.to_s.should == '.'
  end

  it "defers to the last element's renderer if not empty" do
    @cell.stub(:empty?).and_return false
    object = mock 'object'
    fake_renderer = mock 'fake_renderer'
    fake_renderer.should_receive(:to_s).and_return('q')
    fake_renderer_class = mock 'fake renderer class'
    fake_renderer_class.stub(:new).and_return(fake_renderer)
    Renderer.should_receive(:for).with(object).and_return(fake_renderer_class)
    @cell.stub(:[]).with(-1).and_return object
    @renderer.to_s.should == 'q'
  end
end
