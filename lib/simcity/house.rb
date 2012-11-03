module Simcity
  class House < Structure
    include Simcity::MapHelper
    attr_accessor :powered, :watered

    def initialize(map)
      super
      @resource_rate = 1
      @powered = false
      @watered = false
    end

    def powered?
      @powered
    end

    def watered?
      @watered
    end

    def consume_resources
      consume_power
      consume_water
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

    def tick
      consume_resources
    end
  end
end
