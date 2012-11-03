require_relative 'helper_mixin'
module Simcity
  class House < Structure
    include Simcity::HelperMixin
    attr_accessor :powered

    def initialize(map)
      super
      @resource_rate = 1
      @powered = false
    end

    def powered?
      @powered
    end

    def consume_power
      neighbor_cells = map.neighbors_for_object(self)
      power = first_type_of_object_in_cells Actor::Power, neighbor_cells
      if power
        @powered = true
        map.cell_for_object(power).delete(power)
      end
    end

    def tick
      @powered = false
      consume_power
    end
  end
end