module Simcity
  class House < Structure
    include Simcity::MapHelper
    include Simcity::ResourceHelper

    def initialize(map)
      super
      @resource_rate = 1
      @powered = false
      @watered = false
    end

    def consume_resources
      consume_power
      consume_water
      #produce_garbage
    end

    def tick
      consume_resources
    end
  end
end
