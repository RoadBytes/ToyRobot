require_relative "robot.rb"
require_relative "input_parser.rb"

class TerminalManager
  attr_reader :input_parser
  def initialize
    @input_parser = InputParser.new(Robot.new)
  end

  def play
    welcome_user
    loop do
      display_instructions

      input = gets.chomp
      break if input[0].downcase == 'q'

      output_results(input)
    end
  end

  def welcome_user
    system("clear")
    puts "Welcome to Toy Robot"
  end

  def display_instructions
    puts "input 'q' to quit or input a command for your robot"
    puts "PLACE X-coor,Y-coor,Direction:"
    puts "        place robot on coordinates facing Direction"
    puts "MOVE:   go one direction forward"
    puts "LEFT:   turn left"
    puts "RIGHT:  turn right"
    puts "REPORT: display your location and direction"
  end

  def output_results(command_string)
    system("clear")

    puts "\nRobot Output:\n\n"

    input_parser.parse(command_string)
    input_parser.run
    puts
  end
end

TerminalManager.new.play
