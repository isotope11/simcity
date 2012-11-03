module Simcity
  class Renderer::Map
    attr_accessor :map

    def initialize(map)
      @map = map
    end

    def to_s
      @map.grid.map do |row|
        row.map do |cell|
          Renderer::MapCell.new(cell).to_s
        end.join("")
      end.join("\n")
    end
  end
end
