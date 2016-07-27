class Robot
  attr_reader :x, :y, :direction
  DIRECTIONS = [:NORTH, :SOUTH, :EAST, :WEST]
  TABLE_SIZE = 5

  def place(x, y, direction)
    return unless DIRECTIONS.include? direction
    return unless robot_in_bounds
    @x         = x
    @y         = y
    @direction = direction
  end

  def report
    "I'm not on the table"
  end

  private

  def robot_in_bounds
    return false if x.nil? or y.nil?
    x < TABLE_SIZE and y < TABLE_SIZE and
    x > 0 and y > 0
  end
end
