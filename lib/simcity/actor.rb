require_relative 'helper_mixin'
module Simcity
  class Actor
    include Simcity::HelperMixin
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
        effective_neighbors = neighbors - [last_cell]
        road = first_type_of_object_in_cells Structure::Road, effective_neighbors
        @last_cell = map.cell_for_object(self)
        map.cell_for_object(road) << self if road
        @last_cell.delete(self)
      end
    end
  end
end
