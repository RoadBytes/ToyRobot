require_relative "robot.rb"
require_relative "input_parser.rb"

class TerminalManager
  attr_reader :input_parser
  def initialize
    @input_parser = InputParser.new(Robot.new)
  end

  def play
    puts "Welcome to Toy Robot"
    loop do
      puts "input q to quit or input a command for your robot"
      puts "PLACE X-coor, Y-coor, Direction"
      puts "MOVE go one direction forward"
      puts "LEFT turn left"
      puts "RIGHT turn right"
      puts "REPORT display your location and direction"
      input = gets.chomp

      break if input[0].downcase == 'q'

      input_parser.parse(input)
      input_parser.run
    end
  end
end

TerminalManager.new.play
