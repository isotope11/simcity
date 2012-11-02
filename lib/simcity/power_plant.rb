module Simcity
  class PowerPlant < Structure
    attr_accessor :resource_rate

    def initialize(map)
      super
      @resource_rate = 1
    end

    def generate_power
      Actor::Power.new(map)
    end

    def tick
      road = map.neighbors_for_object(self).detect do |map_cell|
        map_cell.detect {|object| object.is_a?(Structure::Road) }
      end
      return unless road
      road = road.detect {|object| object.is_a?(Structure::Road) }
      map.cell_for_object(road) << generate_power
    end
  end
end
