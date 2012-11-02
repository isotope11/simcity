module Simcity
  class Structure
    attr_accessor :map

    def initialize(map)
      @map = map
    end

    def neighbors
      map.neighbors_for_object(self)
    end

    def point
      map.point_for_object(self)
    end

    class Road < Structure
    end
  end
end
