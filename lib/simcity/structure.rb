module Simcity
  class Structure
    def initialize(map)
      @map = map
    end

    def neighbors
      @map.neighbors_for_object(self)
    end
  end
end
