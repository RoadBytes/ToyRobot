# Robot object impelemented to specs
class Robot
  attr_accessor :x, :y, :direction

  DIRECTIONS    = [:SOUTH, :EAST, :NORTH, :WEST].freeze
  USER_COMMANDS = %w(place report move left right).freeze
  TABLE_SIZE    = 5
  # (0, 0) south west most corner of square table

  def place(x, y, direction)
    return self unless DIRECTIONS.include? direction
    return self unless coordinates_in_bounds(x, y)
    @x         = x
    @y         = y
    @direction = direction
    self
  end

  def report
    return self if robot_not_set
    puts "#{x}, #{y}, #{direction}"
    self
  end

  # rubocop:disable Metrics/PerceivedComplexity
  def move
    self.x += 1 if east? && not_on_east_edge?
    self.x -= 1 if west? && not_on_west_edge?
    self.y += 1 if north? && not_on_north_edge?
    self.y -= 1 if south? && not_on_south_edge?
    self
  end
  # rubocop:enable Metrics/PerceivedComplexity

  def left
    return self if robot_not_set
    index = DIRECTIONS.index(direction)
    new_index = (index + 1) % DIRECTIONS.size
    self.direction = DIRECTIONS[new_index]
    self
  end

  def right
    return self if robot_not_set
    index = DIRECTIONS.index(direction)
    new_index = index - 1
    self.direction = DIRECTIONS[new_index]
    self
  end

  private

  def coordinates_in_bounds(x, y)
    x < TABLE_SIZE && y < TABLE_SIZE &&
      x >= 0 && y >= 0
  end

  def robot_not_set
    x.nil? || y.nil? || direction.nil?
  end

  def north?
    direction == :NORTH
  end

  def south?
    direction == :SOUTH
  end

  def east?
    direction == :EAST
  end

  def west?
    direction == :WEST
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
