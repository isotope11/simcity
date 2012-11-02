module Simcity
  class Renderer::MapCell
    attr_accessor :map_cell

    def initialize(map_cell)
      @map_cell = map_cell
    end

    def to_s
      return '.' if @map_cell.empty?
      Renderer.for(map_cell[-1]).to_s
    end
  end
end
