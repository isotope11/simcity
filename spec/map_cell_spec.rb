require 'spec_helper'

describe MapCell do
  it 'can have stuff added to it' do
    cell = MapCell.new
    object = mock
    cell << object
    cell.include?(object).should be_true
  end
end
