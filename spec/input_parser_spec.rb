require_relative "../app/input_parser.rb"
require_relative "../app/robot.rb"

describe InputParser do
  describe "#parse" do
    it "breaks up a string into an array of commands and arguments" do
      one_command_array = InputParser.new(Robot.new).
        parse("PLACE 0,0,NORTH MOVE REPORT")
      two_command_array = InputParser.new(Robot.new).
        parse("PLACE 0,0,NORTH LEFT REPORT")
      three_command_array = InputParser.new(Robot.new).
        parse("PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT")

      expect(one_command_array).to eq ["place", "0,0,north", "move", "report"]
      expect(two_command_array).to eq ["place", "0,0,north", "left", "report"]
      expect(three_command_array).to eq ["place", "1,2,east", "move", "move", "left", "move", "report"]
    end
  end

  describe "#run" do
    it "executes a command_array on a Robot" do
      parser              = InputParser.new(Robot.new)
      one_command_array   = ["place", "0,0,north", "move", "report"]
      two_command_array   = ["place", "0,0,north", "left", "report"]
      three_command_array = ["place", "1,2,east", "move", "move", "left", "move", "report"]

      allow(STDOUT).to receive(:puts).with("0, 1, NORTH")
      allow(STDOUT).to receive(:puts).with("0, 0, WEST")
      allow(STDOUT).to receive(:puts).with("3, 3, NORTH")

      parser.command_array = one_command_array
      parser.run
      parser.command_array = two_command_array
      parser.run
      parser.command_array = three_command_array
      parser.run

      expect(STDOUT).to have_received(:puts).with("0, 1, NORTH")
      expect(STDOUT).to have_received(:puts).with("0, 0, WEST")
      expect(STDOUT).to have_received(:puts).with("3, 3, NORTH")
    end
  end
end
