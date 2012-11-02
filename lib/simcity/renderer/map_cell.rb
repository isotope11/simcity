module Simcity
  class Renderer::MapCell
    attr_accessor :map_cell

    def initialize(map_cell)
      @map_cell = map_cell
    end

    def to_s
      return '.' if @map_cell.empty?
      object = map_cell[-1]
      Renderer.for(object).new.to_s
    end
  end
end
