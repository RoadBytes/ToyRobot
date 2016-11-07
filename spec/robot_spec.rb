require_relative '../app/robot.rb'
require_relative '../app/table.rb'

describe Robot do
  describe '#report' do
    it "doesn't puts if `place` hasn't been called" do
      floating_robot = Robot.new
      allow(STDOUT).to receive(:puts)

      floating_robot.report

      expect(STDOUT).not_to have_received(:puts)
    end

    it 'puts coordinates from `place` call' do
      placed_robot = Robot.new
      placed_robot.place(0, 1, :north)
      allow(STDOUT).to receive(:puts).with('0, 1, north')

      placed_robot.report

      expect(STDOUT).to have_received(:puts).with('0, 1, north')
    end
  end

  describe '#place' do
    context 'with valid input' do
      it 'sets x, y, and direction' do
        robot = Robot.new
        robot.place(0, 1, :north)

        expect(robot.x).to eq 0
        expect(robot.y).to eq 1
        expect(robot.direction).to eq :north
      end
    end

    context 'with invalid input' do
      it 'ignores commands with non-direction inputs' do
        robot = Robot.new
        robot.place(0, 1, :SANDWHICH)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it 'ignores commands with x over bounds' do
        robot = Robot.new
        robot.place(7, 0, :north)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it 'ignores commands with x under bounds' do
        robot = Robot.new
        robot.place(-1, 0, :north)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it 'ignores commands with y over bounds' do
        robot = Robot.new
        robot.place(0, 7, :north)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it 'ignores commands with y under bounds' do
        robot = Robot.new
        robot.place(0, -1, :north)

        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.direction).to eq nil
      end

      it 'leaves x, y, and direction unchanged' do
        robot = Robot.new
        robot.place(0, 1, :north)

        robot.place(0, 6, :CALI)

        expect(robot.x).to eq 0
        expect(robot.y).to eq 1
        expect(robot.direction).to eq :north
      end

      it 'leaves robot unchanged when missing args' do
        robot = Robot.new
        robot.place(0, 1, :north)

        robot.place

        expect(robot.x).to eq 0
        expect(robot.y).to eq 1
        expect(robot.direction).to eq :north
      end
    end

    describe '#move' do
      it 'adds one to x when facing :east' do
        east_robot = Robot.new
        east_robot.place(1, 1, :east)

        east_robot.move

        expect(east_robot.x).to eq 2
        expect(east_robot.y).to eq 1
        expect(east_robot.direction).to eq :east
      end

      it 'subtracts one to x when facing :west' do
        east_robot = Robot.new
        east_robot.place(1, 1, :west)

        east_robot.move

        expect(east_robot.x).to eq 0
        expect(east_robot.y).to eq 1
        expect(east_robot.direction).to eq :west
      end

      it 'adds one to y when facing :north' do
        east_robot = Robot.new
        east_robot.place(1, 1, :north)

        east_robot.move

        expect(east_robot.x).to eq 1
        expect(east_robot.y).to eq 2
        expect(east_robot.direction).to eq :north
      end

      it 'subtracts one to y when facing :south' do
        east_robot = Robot.new
        east_robot.place(1, 1, :south)

        east_robot.move

        expect(east_robot.x).to eq 1
        expect(east_robot.y).to eq 0
        expect(east_robot.direction).to eq :south
      end

      context 'when #move is invalid' do
        it 'leaves the robot unchanged if moving out of bounds east' do
          east_robot = Robot.new
          east_robot.place(4, 2, :east)

          east_robot.move

          expect(east_robot.x).to eq 4
          expect(east_robot.y).to eq 2
          expect(east_robot.direction).to eq :east
        end

        it 'leaves the robot unchanged if moving out of bounds west' do
          east_robot = Robot.new
          east_robot.place(0, 2, :west)

          east_robot.move

          expect(east_robot.x).to eq 0
          expect(east_robot.y).to eq 2
          expect(east_robot.direction).to eq :west
        end

        it 'leaves the robot unchanged if moving out of bounds north' do
          east_robot = Robot.new
          east_robot.place(3, 4, :north)

          east_robot.move

          expect(east_robot.x).to eq 3
          expect(east_robot.y).to eq 4
          expect(east_robot.direction).to eq :north
        end

        it 'leaves the robot unchanged if moving out of bounds south' do
          east_robot = Robot.new
          east_robot.place(3, 0, :south)

          east_robot.move

          expect(east_robot.x).to eq 3
          expect(east_robot.y).to eq 0
          expect(east_robot.direction).to eq :south
        end

        it 'leaves the robot unchanged if not on table' do
          floating_robot = Robot.new

          floating_robot.move

          expect(floating_robot.x).to eq nil
          expect(floating_robot.y).to eq nil
          expect(floating_robot.direction).to eq nil
        end
      end
    end
  end

  describe '#left' do
    it "does nothing if the robot hasn't been placed" do
      floating_robot = Robot.new
      floating_robot.left

      expect(floating_robot.x).to eq nil
      expect(floating_robot.y).to eq nil
      expect(floating_robot.direction).to eq nil
    end

    it 'changes direction from south to east' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :south)
      floating_robot.left

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :east
    end

    it 'changes direction from east to north' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :east)
      floating_robot.left

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :north
    end

    it 'changes direction from north to west' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :north)
      floating_robot.left

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :west
    end

    it 'changes direction from east to south' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :west)
      floating_robot.left

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :south
    end
  end

  describe '#right' do
    it "does nothing if the robot hasn't been placed" do
      floating_robot = Robot.new
      floating_robot.right

      expect(floating_robot.x).to eq nil
      expect(floating_robot.y).to eq nil
      expect(floating_robot.direction).to eq nil
    end

    it 'changes direction from south to west' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :south)
      floating_robot.right

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :west
    end

    it 'changes direction from west to north' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :west)
      floating_robot.right

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :north
    end

    it 'changes direction from north to east' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :north)
      floating_robot.right

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :east
    end

    it 'changes direction from east to south' do
      floating_robot = Robot.new
      floating_robot.place(3, 2, :east)
      floating_robot.right

      expect(floating_robot.x).to eq 3
      expect(floating_robot.y).to eq 2
      expect(floating_robot.direction).to eq :south
    end
  end
end
