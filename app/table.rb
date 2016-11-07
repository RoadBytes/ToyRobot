# handles how objects move on it
class Table
  attr_accessor :x, :y
  TABLE_SIZE = 5
  # (0, 0) south west most corner of square table

  def coordinates_in_bounds(x, y)
    return if x.nil? || y.nil?
    x < TABLE_SIZE && y < TABLE_SIZE &&
      x >= 0 && y >= 0
  end

  def move(direction)
    case direction
    when :east
      self.x += 1 if not_on_east_edge?
    when :west
      self.x -= 1 if not_on_west_edge?
    when :north
      self.y += 1 if not_on_north_edge?
    when :south
      self.y -= 1 if not_on_south_edge?
    end
  end

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
