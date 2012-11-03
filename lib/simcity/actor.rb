module Simcity
  class Actor
    attr_accessor :map, :last_cell

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
        road = first_neighboring_road
        @last_cell = map.cell_for_object(self)
        map.cell_for_object(road) << self if road
        @last_cell.delete(self)
      end

      def first_neighboring_road
        neighbors = map.neighbors_for_object(self) - [last_cell]
        road = nil
        neighbors.detect do |map_cell|
          road = map_cell.detect {|object| object.is_a?(Structure::Road) }
        end
        road
      end
    end
  end
end
