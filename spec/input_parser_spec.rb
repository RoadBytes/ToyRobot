require_relative '../app/robot.rb'
require_relative '../app/table.rb'
require_relative '../app/input_parser.rb'

describe InputParser do
  # describe '#parse' do
  #   it 'breaks up a string into an array of commands and arguments' do
  #     one_command_array   = InputParser
  #                           .new(Robot.new)
  #     one_command_array.parse('PLACE 0,0,NORTH MOVE REPORT')

  #     two_command_array   = InputParser
  #                           .new(Robot.new)
  #     two_command_array.parse('PLACE 0,0,NORTH LEFT REPORT')

  #     three_command_array = InputParser
  #                           .new(Robot.new)
  #     three_command_array.parse('PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT')

  #     expect(one_command_array.commands)
  #     .to eq [
  #       { command: 'place', x: 0, y: 0, direction: :north },
  #       { command: 'move' }, { command: 'report' }
  #     ]
  #     expect(two_command_array.commands)
  #     .to eq [
  #       { command: 'place', x: 0, y: 0, direction: :north },
  #       { command: 'left' },
  #       { command: 'report' }
  #     ]
  #     expect(three_command_array.commands)
  #     .to eq [
  #       { command: 'place', x: 1, y: 2, direction: :east },
  #       { command: 'move' }, { command: 'move' }, { command: 'left' },
  #       { command: 'move' }, { command: 'report' }
  #     ]
  #   end
  # end

  describe '#run_input' do
    it 'executes a command_hash on a Robot' do
      parser           = InputParser.new(Robot.new)
      one_command_hash = [
        { command: 'place', x: 0, y: 0, direction: :north },
        { command: 'move' }, { command: 'report' }
      ]
      two_command_hash = [
        { command: 'place', x: 0, y: 0, direction: :north },
        { command: 'left' },
        { command: 'report' }
      ]
      three_command_hash = [
        { command: 'place', x: 1, y: 2, direction: :east },
        { command: 'move' }, { command: 'move' }, { command: 'left' },
        { command: 'move' }, { command: 'report' }
      ]

      allow(STDOUT).to receive(:puts).with('0, 1, north')
      allow(STDOUT).to receive(:puts).with('0, 0, west')
      allow(STDOUT).to receive(:puts).with('3, 3, north')

      parser.commands = one_command_hash
      parser.run_input
      parser.commands = two_command_hash
      parser.run_input
      parser.commands = three_command_hash
      parser.run_input

      expect(STDOUT).to have_received(:puts).with('0, 1, north')
      expect(STDOUT).to have_received(:puts).with('0, 0, west')
      expect(STDOUT).to have_received(:puts).with('3, 3, north')
    end
  end
end
