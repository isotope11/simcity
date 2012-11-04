module Simcity
  class Map
    attr_accessor :width, :height, :grid
    def initialize width=100, height=100
      @width, @height = [width, height]
      build_grid
    end

    def neighbors_for_object object
      cell = cell_for_object(object)
      cell.neighbors
    end

    def cell_for_object object
      row = row_for_object(object)
      return nil unless row
      row.detect{|c| c.include?(object) }
    end

    def row_for_object object
      @grid.detect do |row|
        row.detect do |cell|
          cell.include?(object)
        end
      end
    end

    def point_for_cell cell
      y = @grid.index(row_for_cell(cell))
      x = @grid[y].index(column_for_cell(cell))
      Point.new(x, y)
    end

    def point_for_object object
      cell = cell_for_object(object)
      point_for_cell(cell)
    end

    def row_for_cell cell
      @grid.detect do |row|
        row.detect do |c|
          c == cell
        end
      end
    end

    def column_for_cell cell
      row_for_cell(cell).detect{|c| c == cell }
    end

    def cell_at point
      @grid[point.y][point.x]
    end

    def tick
      objects = []
      @grid.each do |row|
        row.each do |cell|
          cell.each do |obj|
            objects << obj
          end
        end
      end
      objects.each(&:tick)
    end

    private
    def build_grid
      @grid = []
      height.times do |i|
        line = []
        width.times do |g|
          line << MapCell.new(self)
        end
        @grid << line
      end
    end

    class Point < Struct.new(:x, :y)
      def north
        Point.new(self.x, self.y - 1)
      end

      def south
        Point.new(self.x, self.y + 1)
      end

      def east
        Point.new(self.x + 1, self.y)
      end

      def west
        Point.new(self.x - 1, self.y)
      end
    end
  end
end
