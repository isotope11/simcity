module Simcity
  class GarbageDump < Structure
    include Simcity::MapHelper
    include Simcity::ResourceHelper

    def consume_resources
      consume_garbage(10)
    end

    def tick
      consume_resources
    end
  end
end
