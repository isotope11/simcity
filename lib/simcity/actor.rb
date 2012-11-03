module Simcity
  class Actor

    attr_accessor :map

    def initialize map
      @map = map
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
          road = map_cell.detect {|object| object.is_a?(Structure::Road) }
        end
        if road
          map.cell_for_object(road) << self
        end
        #If there is a road, we'll copy ourselves to it, but regardless, we remove ourselves from the map
        map.cell_for_object(self).delete(self)
      end
    end
  end
end
