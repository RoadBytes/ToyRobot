# Robot object impelemented to specs
class Robot
  attr_accessor :direction, :table

  def initialize
    @table = Table.new
  end

  DIRECTIONS    = [:SOUTH, :EAST, :NORTH, :WEST].freeze
  USER_COMMANDS = %w(place report move left right).freeze

  def place(x, y, direction)
    return self unless DIRECTIONS.include? direction
    return self unless coordinates_in_bounds(x, y)
    table.set(x, y)
    @direction = direction
    self
  end

  def report
    return self if robot_not_set
    puts "#{x}, #{y}, #{direction}"
    self
  end

  def move
    table.move(direction)
    self
  end

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

  def x
    table.x
  end

  def y
    table.y
  end

  private

  def coordinates_in_bounds(x, y)
    table.coordinates_in_bounds(x, y)
  end

  def robot_not_set
    x.nil? || y.nil? || direction.nil?
  end
end
