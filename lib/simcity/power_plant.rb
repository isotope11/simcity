require_relative 'helper_mixin'
module Simcity
  class PowerPlant < Structure
    include Simcity::HelperMixin
    attr_accessor :resource_rate

    def initialize(map)
      super
      @resource_rate = 1
    end

    def generate_power
      Actor::Power.new(map)
    end

    def tick
      road = first_neighboring_road
      map.cell_for_object(road) << generate_power if road
    end
  end
end
