class InputParser
  attr_accessor :command_array
  VALID_COMMANDS = Robot::USER_COMMANDS

  def initialize(robot)
    @robot = robot
  end

  def parse(command_input)
    @command_array = command_input.downcase.split(' ')
  end

  def run
    loop do
      break if command_array.empty?

      command = command_array.shift
      next unless VALID_COMMANDS.include? command

      execute(command)
    end
  end

  private

  def execute(command)
    if command == 'place'
      place_arguments = command_array.shift
      place_arguments = place_arguments.split(',')
      @robot.send command,
        place_arguments[0].to_i,
        place_arguments[1].to_i,
        place_arguments[2].upcase.to_sym
    else
      @robot.send command
    end
  end
end
