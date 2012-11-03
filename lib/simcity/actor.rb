module Simcity
  class Actor

    attr_accessor :map

    def initialize map
      @map = map
      @last_cell = nil
    end

    def resource_type
      nil
    end

    def offer? resource
      resource_type == resource
    end

    def tick
    end

    class Power < Actor
      def resource_type
        :power
      end

      def tick
        road = nil
        map.neighbors_for_object(self).detect do |map_cell|
          return false if map_cell == @last_cell # Don't go back to the cell we were just in
          road = map_cell.detect {|object| object.is_a?(Structure::Road) }
        end
        @last_cell = map.cell_for_object(self)
        if road
          map.cell_for_object(road) << self
        end
        #If there is a road, we'll copy ourselves to it, but regardless, we remove ourselves from the map
        @last_cell.delete(self)
      end
    end
  end
end
