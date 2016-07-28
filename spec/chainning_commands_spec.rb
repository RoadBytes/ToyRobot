require_relative '../app/robot.rb'

describe 'chainning robot commands' do
  it "robot doesn't set x, y, or direction until place is called" do
    floating_robot = Robot.new
    floating_robot.left.right.move.report

    expect(floating_robot.x).to eq nil
    expect(floating_robot.y).to eq nil
    expect(floating_robot.direction).to eq nil
  end

  it 'sets instance variables to last place call' do
    floating_robot = Robot.new
    allow(STDOUT).to receive(:puts).with('1, 2, SOUTH')
    allow(STDOUT).to receive(:puts).with('2, 3, NORTH')
    floating_robot
      .place(1, 2, :SOUTH).report.left.move.right.move
      .place(2, 3, :NORTH).report

    expect(STDOUT).to have_received(:puts).with('1, 2, SOUTH')
    expect(STDOUT).to have_received(:puts).with('2, 3, NORTH')
    expect(floating_robot.x).to eq 2
    expect(floating_robot.y).to eq 3
    expect(floating_robot.direction).to eq :NORTH
  end

  it 'can chain mulitple commands' do
    floating_robot = Robot.new
    allow(STDOUT).to receive(:puts).with('1, 3, NORTH')

    floating_robot.place(1, 2, :NORTH).left.right.move.report

    expect(STDOUT).to have_received(:puts).with('1, 3, NORTH')
    expect(floating_robot.x).to eq 1
    expect(floating_robot.y).to eq 3
    expect(floating_robot.direction).to eq :NORTH
  end
end
