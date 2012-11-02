module Simcity
  class Map
    attr_accessor :width, :height, :grid
    def initialize width=100, height=100
      @width = width
      @height = height
      build_grid
    end

    private
    def build_grid
      @grid = []
      height.times do |i|
        line = []
        width.times do |g|
          line << MapCell.new
        end
        @grid << line
      end
    end
  end
end
