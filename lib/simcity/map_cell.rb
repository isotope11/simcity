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
      [:north, :south, :east, :west].map do |sym|
        #Figure out the point to the [:north, :south, etc] of self.point
        translated_point = point.send(sym)
        map.cell_at(translated_point)
      end.compact
    end

    def tick
      each(&:tick)
    end
  end
end
