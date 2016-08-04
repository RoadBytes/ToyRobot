require_relative 'robot.rb'
require_relative 'input_parser.rb'
require_relative 'board.rb'
require_relative 'table.rb'

# Handles O/I from terminal
class TerminalManager
  attr_reader :input_parser, :board
  def initialize
    @robot        = Robot.new
    @input_parser = InputParser.new(@robot)
    @board        = Board.new(@robot)
  end

  def play
    welcome_user
    loop do
      display_instructions

      input = gets.chomp
      break if input[0] == 'q'

      output_results(input)
    end
  end

  def welcome_user
    system('clear')
    puts 'Welcome to Toy Robot'
  end

  def display_instructions
    puts "input 'q' to quit or input a command for your robot"
    puts 'PLACE X-coor,Y-coor,Direction:'
    puts '        place robot on coordinates facing Direction'
    puts 'MOVE:   go one direction forward'
    puts 'LEFT:   turn left'
    puts 'RIGHT:  turn right'
    puts 'REPORT: display your location and direction'
  end

  def output_results(command_string)
    system('clear')

    puts "\nRobot Output:\n\n"

    input_parser.parse(command_string)
    input_parser.run

    puts board.return_board
    puts
  end
end

TerminalManager.new.play
