require 'spec_helper'

describe Actor do

  before do
    @actor = Actor.new
  end

  it "responds to offer" do
    @actor.should respond_to(:offer?)
  end

  it "offers nothing" do
    @actor.offer?(:power).should be_false
  end
end
