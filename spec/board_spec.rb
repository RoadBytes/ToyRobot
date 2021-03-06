require_relative '../app/robot.rb'
require_relative '../app/table.rb'
require_relative '../app/board.rb'

describe Board do
  describe '#return_board(robot)' do
    it 'returns a blank board with new robot' do
      blank_board = "_ _ _ _ _\n" * 4 + '_ _ _ _ _'
      new_robot   = Robot.new

      game_board = Board.new(new_robot).return_board

      expect(game_board).to eq blank_board
    end

    it 'returns a board with new robot facing north' do
      north_board = "_ _ _ _ _\n" \
                    "_ _ _ _ _\n" \
                    "_ _ _ _ _\n" \
                    "_ ^ _ _ _\n" \
                    '_ _ _ _ _'
      new_robot   = Robot.new.place(1, 1, :north)

      game_board = Board.new(new_robot).return_board

      expect(game_board).to eq north_board
    end

    it 'returns a board with new robot facing south' do
      north_board = "_ _ _ _ v\n" \
                    "_ _ _ _ _\n" \
                    "_ _ _ _ _\n" \
                    "_ _ _ _ _\n" \
                    '_ _ _ _ _'
      new_robot   = Robot.new.place(4, 4, :south)

      game_board = Board.new(new_robot).return_board

      expect(game_board).to eq north_board
    end
  end
end
