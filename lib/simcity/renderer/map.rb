module Simcity
  class Renderer::Map
    attr_accessor :map

    def initialize(map)
      @map = map
    end

    def run_simulation!
      while true do
        70.times { puts "" }
        puts self.to_s
        map.tick
        sleep(1)
      end
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
