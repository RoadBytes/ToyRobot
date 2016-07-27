require_relative "../app/robot.rb"

describe Robot do
  describe "#report" do
    it "sends 'not on table' if `place` hasn't been called" do
      floating_robot = Robot.new

      expect(floating_robot.report).to eq "I'm not on the table"
    end

    it "sends coordinates from `place` call" do
      placed_robot = Robot.new
      placed_robot.place(0, 0, :NORTH)

      expect(placed_robot.report).to eq "0, 1, NORTH"
    end
  end

  describe "#place" do
    context "with valid input" do
      it "sets x, y, and direction" do
        robot = Robot.new
        robot.place(0, 1, :NORTH)

        expect(robot.x).to eq 0
        expect(robot.y).to eq 1
        expect(robot.direction).to eq :NORTH
      end
    end

    context "with invalid input" do
      it "ignores commands with non-direction inputs" do
        robot = Robot.new
        robot.place(0, 1, :SANDWHICH)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it "ignores commands with x over bounds" do
        robot = Robot.new
        robot.place(7, 0, :NORTH)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it "ignores commands with x under bounds" do
        robot = Robot.new
        robot.place(-1, 0, :NORTH)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it "ignores commands with y over bounds" do
        robot = Robot.new
        robot.place(0, 7, :NORTH)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it "ignores commands with y under bounds" do
        robot = Robot.new
        robot.place(0, -1, :NORTH)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it "leaves x, y, and direction unchanged" do
        robot = Robot.new
        robot.place(0, 1, :NORTH)

        robot.place(0, 6, :CALI)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end
    end
  end
end
