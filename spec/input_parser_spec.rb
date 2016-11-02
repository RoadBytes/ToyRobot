require_relative '../app/robot.rb'
require_relative '../app/table.rb'
require_relative '../app/input_parser.rb'

describe InputParser do
  describe '::new' do
    it 'sends ::new to Robot' do
      allow(Robot).to receive(:new)

      InputParser.new

      expect(Robot).to have_received(:new)
    end
  end

  describe '#run_input' do
    it 'executes a command string on a Robot' do
      parser = InputParser.new

      allow(STDOUT).to receive(:puts).with('0, 1, north')
      allow(STDOUT).to receive(:puts).with('0, 0, west')
      allow(STDOUT).to receive(:puts).with('3, 3, north')

      parser.run_input('PLACE 0,0,NORTH MOVE REPORT')
      parser.run_input('PLACE 0,0,NORTH LEFT REPORT')
      parser.run_input('PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT')

      expect(STDOUT).to have_received(:puts).with('0, 1, north')
      expect(STDOUT).to have_received(:puts).with('0, 0, west')
      expect(STDOUT).to have_received(:puts).with('3, 3, north')
    end
  end
end
