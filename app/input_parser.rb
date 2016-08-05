# InputParser handles string input from user and
# breaks it into commands for Robot
class InputParser
  attr_accessor :commands
  VALID_COMMANDS = Robot::USER_COMMANDS

  def initialize(robot)
    @robot = robot
  end

  # example command:
  #   {command: :move}
  #   {command: :place, x: 0, y: 3, direction: :north}
  def parse(command_input)
    words     = command_input.downcase.split(' ')
    @commands = []

    while words.any?
      word      = words.shift
      arguments = {}

      if word == 'place'
        unparsed_arguments = words.shift
        arguments          = parse_arguments(unparsed_arguments)
      end

      command = { command: word }.merge(arguments)

      @commands << command
    end
  end

  def parse_arguments(args_string)
    argument_array = args_string.split(',')
    {
      x: argument_array[0].to_i,
      y: argument_array[1].to_i,
      direction: argument_array[2].to_sym
    }
  end

  def run_input
    while commands.any?
      command = commands.shift
      next unless VALID_COMMANDS.include? command[:command]

      execute(command)
    end
  end

  private

  def execute(command)
    args = [command[:x], command[:y], command[:direction]].compact
    @robot.send command[:command], *args
  end
end
