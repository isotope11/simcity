module Simcity
  class PowerPlant < Structure
    attr_accessor :resource_rate

    def initialize(map)
      super
      @resource_rate = 1
    end

    def generate_power
      Actor::Power.new
    end

    def tick
      map.cell_at(point.north) << generate_power
    end
  end
end
