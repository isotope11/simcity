module Simcity
  module HelperMixin
    def first_neighboring_road
      neighbors = map.neighbors_for_object(self)
      neighbors -= [last_cell] if defined?(last_cell)
      road = nil
      neighbors.detect do |map_cell|
        road = map_cell.detect {|object| object.is_a?(Structure::Road) }
      end
      road
    end
  end
end
