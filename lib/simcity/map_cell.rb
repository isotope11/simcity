module Simcity

  class MapCell < Array
    attr_accessor :map

    def initialize map
      @map = map
    end

    def point
      map.point_for_cell(self)
    end

    def neighbors
      [:north, :south, :east, :west].map {|sym| map.cell_at(point.send(sym)) }
    end
  end
end
