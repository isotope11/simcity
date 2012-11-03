module Simcity
  class WaterPump < Structure
    include Simcity::MapHelper

    def initialize(map)
      super
      @resource_rate = 1
    end

    def generate_water
      Actor::Water.new(map)
    end

    def tick
      road = first_type_of_object_in_cells Structure::Road, neighbors
      map.cell_for_object(road) << generate_water if road
    end
  end
end
