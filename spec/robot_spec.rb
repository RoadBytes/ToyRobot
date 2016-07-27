require_relative "../app/robot.rb"

describe Robot do
  describe "#navigate" do
    it "returns true" do
      expect(Robot.new.navigate).to eq true
    end
  end
end
