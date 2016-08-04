class Table
  attr_accessor :x, :y
  TABLE_SIZE = 5
  # (0, 0) south west most corner of square table

  def coordinates_in_bounds(x, y)
    x < TABLE_SIZE && y < TABLE_SIZE &&
      x >= 0 && y >= 0
  end

  # rubocop:disable Metrics/PerceivedComplexity
  def move(direction)
    case direction
    when :EAST
      self.x += 1 if not_on_east_edge?
    when :WEST
      self.x -= 1 if not_on_west_edge?
    when :NORTH
      self.y += 1 if not_on_north_edge?
    when :SOUTH
      self.y -= 1 if not_on_south_edge?
    end
  end
  # rubocop:enable Metrics/PerceivedComplexity

  def set(x, y)
    @x = x
    @y = y
  end

  def not_on_east_edge?
    x != TABLE_SIZE - 1
  end

  def not_on_west_edge?
    x != 0
  end

  def not_on_north_edge?
    y != TABLE_SIZE - 1
  end

  def not_on_south_edge?
    y != 0
  end
end
