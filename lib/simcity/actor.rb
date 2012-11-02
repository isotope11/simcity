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
        old_map_cell = map.cell_for_object(self)
        north_point = old_map_cell.point.north
        new_map_cell = map.cell_at(north_point)
        old_map_cell.delete(self)
        new_map_cell << self
      end
    end
  end
end
