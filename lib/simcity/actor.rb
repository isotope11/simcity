module Simcity
  class Actor

    attr_accessor :map, :last_cell

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
        road = first_neighboring_road
        last_cell = map.cell_for_object(self)
        if road
          map.cell_for_object(road) << self
        end
        #If there is a road, we'll copy ourselves to it, but regardless, we remove ourselves from the map
        last_cell.delete(self)
      end

      def first_neighboring_road
        neighbors = map.neighbors_for_object(self) - [last_cell]
        road = nil
        neighbors.each do |map_cell|
          road = map_cell.detect {|object| object.is_a?(Structure::Road) }
          break if road
        end
        road
      end
    end
  end
end
