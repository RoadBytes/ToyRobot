class Robot
  attr_reader :x, :y, :direction
  DIRECTIONS = [:NORTH, :SOUTH, :EAST, :WEST]
  TABLE_SIZE = 5
  # (0, 0) south west most corner of square table

  def place(x, y, direction)
    return unless DIRECTIONS.include? direction
    return unless coordinates_in_bounds(x, y)
    @x         = x
    @y         = y
    @direction = direction
  end

  def report
    return "" if robot_not_set
    "#{x}, #{y}, #{direction}"
  end

  private

  def coordinates_in_bounds(x, y)
    x < TABLE_SIZE and y < TABLE_SIZE and
    x >= 0 and y >= 0
  end

  def robot_not_set
    x.nil? or y.nil? or direction.nil?
  end
end
