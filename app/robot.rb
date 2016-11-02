# Robot object impelemented to specs
class Robot
  attr_accessor :direction, :table

  def initialize
    # TODO: does a table have a robot?
    # TODO: identify robot and move?
    # Think about multiple robots,
    # table can manage of robots will bump into each other
    # Does it make sense that a parser contains a robot?
    # Does it make sense that a table contains a robot?
    # The code should be simple so ?'s and answers are clear
    # ie. Have you had a Good boss or Bad boss?
    # balance between high and low levels of abstractions
    @table = Table.new
  end

  DIRECTIONS    = [:south, :east, :north, :west].freeze
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
