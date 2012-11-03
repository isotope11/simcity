module Simcity
  module ResourceHelper

    def powered= powered
      @powered = powered
    end

    def watered= watered
      @watered = watered
    end

    def powered?
      @powered
    end

    def watered?
      @watered
    end

    def consume_water
      @watered = false
      water = first_type_of_object_in_cells Actor::Water, neighbors
      if water
        @watered = true
        map.cell_for_object(water).delete(water)
      end
    end

    def consume_power
      @powered = false
      power = first_type_of_object_in_cells Actor::Power, neighbors
      if power
        @powered = true
        map.cell_for_object(power).delete(power)
      end
    end

    def consume_garbage
      garbage = first_type_of_object_in_cells Actor::Garbage, neighbors
      map.cell_for_object(garbage).delete(garbage) if garbage
    end

    def produce_garbage
      road = first_type_of_object_in_cells Structure::Road, neighbors
      map.cell_for_object(road) << Actor::Garbage.new(map) if road
    end
  end
end
