require 'spec_helper'

describe Renderer do
  before do
    @renderer = Renderer
  end

  it 'knows the proper renderer for a given object' do
    object = mock 'obj'
    klass = mock 'fake_class'
    object.stub(:class).and_return(klass)
    klass.stub(:to_s).and_return("Simcity::VanillaIce")
    module Simcity
      class Renderer::VanillaIce; end
    end
    @renderer.for(object).should == Simcity::Renderer::VanillaIce
  end
end
