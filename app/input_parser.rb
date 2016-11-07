# InputParser handles string input from user and
# breaks it into commands for Robot
class InputParser
  attr_accessor :commands
  attr_reader   :robot
  VALID_COMMANDS = Robot::USER_COMMANDS

  def initialize
    @robot    = Robot.new
    @commands = []
  end

  def run_input(input)
    parse(input)
    while commands.any?
      command = commands.shift

      execute(command)
    end
  end

  # example command:
  #   {command: :move}
  #   {command: :place, x: 0, y: 3, direction: :north}
  def parse(command_input)
    words = command_input.downcase.split(' ')

    convert_words(words)
  end

  private

  def convert_words(words)
    while words.any?
      word      = words.shift
      arguments = {}

      if word == 'place'
        unparsed_arguments = words.shift
        arguments          = parse_arguments(unparsed_arguments)
      end

      command = { command: word }.merge(arguments)
      next unless VALID_COMMANDS.include? command[:command]

      commands << command
    end
  end

  def parse_arguments(args_string)
    return {} if args_string.nil?

    argument_array = args_string.split(',')
    {
      x: argument_array[0].to_i,
      y: argument_array[1].to_i,
      direction: argument_array.fetch(2, '').to_sym
    }
  end

  def execute(command)
    args = [command[:x], command[:y], command[:direction]].compact
    robot.send command[:command], *args
  end
end
