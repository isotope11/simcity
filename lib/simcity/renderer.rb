module Simcity
  class Renderer
    def self.for object
      klass = object.class.to_s
      class_eval klass
    end

    class Actor
    end
  end
end

require_relative 'renderer/actor/power'
require_relative 'renderer/structure'
require_relative 'renderer/power_plant'
require_relative 'renderer/map_cell'
require_relative 'renderer/map'
