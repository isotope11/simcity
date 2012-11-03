module Simcity
  module HelperMixin

    def first_neighboring_road
      neighbors = map.neighbors_for_object(self)
      neighbors -= [last_cell] if defined?(last_cell)
      first_type_of_object_in_cells Structure::Road, neighbors
    end

    def first_type_of_object_in_cells type, cells
      object = nil
      cells.detect do |map_cell|
        object = map_cell.detect { |object| object.is_a?(type) }
      end
      object
    end
  end
end
