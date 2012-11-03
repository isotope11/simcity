module Simcity
  module MapHelper

    def neighbors
      map.neighbors_for_object(self)
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
