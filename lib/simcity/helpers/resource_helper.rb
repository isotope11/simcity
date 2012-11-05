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

    def consume_garbage amount = 1
      while amount != 0
        garbage = first_type_of_object_in_cells Actor::Garbage, neighbors
        if garbage
          map.cell_for_object(garbage).delete(garbage)
          amount -= 1
        else
          amount = 0
        end
      end
    end

    def produce_garbage
      road = first_type_of_object_in_cells Structure::Road, neighbors
      map.cell_for_object(road) << Actor::Garbage.new(map) if road
    end
  end
end
