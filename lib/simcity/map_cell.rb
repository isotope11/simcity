module Simcity

  class MapCell < Hash
    attr_accessor :map

    def initialize map
      self.default_proc = proc { |h, k| h[k] = Array.new }
      @map = map
    end

    def point
      map.point_for_cell(self)
    end

    def [] key
      if key.is_a?(Class)
        super
      else
        super(key.class)
      end
    end

    def neighbors
      [:north, :south, :east, :west].map do |sym|
        #Figure out the point to the [:north, :south, etc] of self.point
        translated_point = point.send(sym)
        map.cell_at(translated_point)
      end.compact
    end

    def tick
      each_pair do |key, value|
        value.each(&:tick)
      end
    end

    def include? object
      return false unless keys.include?(object.class)
      self[object].detect {|element| element == object }
    end

    def << object
      self[object] << object
    end

    def delete object
      self[object].delete(object)
    end
  end
end
