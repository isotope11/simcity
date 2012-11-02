require 'spec_helper'

describe Renderer::PowerPlant do
  before do
    @renderer = Renderer::PowerPlant.new
  end

  it 'renders itself as an P' do
    @renderer.to_s.should == 'P'
  end
end
