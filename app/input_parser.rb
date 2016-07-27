class InputParser
  def initialize(robot)
    @robot = robot
  end

  def parse(command)
    command.downcase.split(' ')
  end

  def run(command_array)
    loop do
      command = command_array.shift

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

      break if command_array.empty?
    end
  end
end
