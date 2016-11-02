# returns a board for display of robot
class Board
  ICON_CONVERSION = {
    north: '^',
    south: 'v',
    east:  '>',
    west:  '<'
  }.freeze

  def initialize(robot)
    @robot = robot
    reset_board
  end

  def return_board
    set_icon_on_board
    board.map { |row| row.join(' ') }.reverse.join("\n")
  end

  private

  attr_reader :robot, :board

  def reset_board
    @board = [%w(_ _ _ _ _),
              %w(_ _ _ _ _),
              %w(_ _ _ _ _),
              %w(_ _ _ _ _),
              %w(_ _ _ _ _)]
  end

  def robot_icon
    ICON_CONVERSION[robot.direction]
  end

  def set_icon_on_board
    return if robot.x.nil?
    reset_board
    board[robot.y][robot.x] = robot_icon
  end
end
