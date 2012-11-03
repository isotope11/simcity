module Simcity
  class Actor
    include Simcity::MapHelper
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

    class Resource < Actor
      def tick
        effective_neighbors = neighbors - [last_cell]
        road = first_type_of_object_in_cells Structure::Road, effective_neighbors
        @last_cell = map.cell_for_object(self)
        if road
          map.cell_for_object(road) << self if road
          @last_cell.delete(self)
        elsif self.respond_to?(:dieing_resource?) && dieing_resource?
          @last_cell.delete(self)
        end
      end
    end

    class DieingResource < Resource
      def dieing_resource?
        true
      end
    end

    class Power < DieingResource
      def resource_type
        :power
      end
    end

    class Water < DieingResource
      def resource_type
        :water
      end
    end
  end
end
