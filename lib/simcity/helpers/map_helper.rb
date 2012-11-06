module Simcity
  module MapHelper

    def neighbors
      map.neighbors_for_object(self)
    end

    def first_type_of_object_in_cells type, cells
      object = nil
      cells.detect do |map_cell|
        if map_cell.keys.include?(type)
          object = map_cell[type].first
        else
          false
        end
      end
      object
    end
  end
end
