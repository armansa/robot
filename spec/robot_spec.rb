require './src/board'
require './src/robot'

describe Robot do
  it "runs robot actions" do
    board = Board.new(width: 5, height: 5)
    robot = Robot.new(board: board)
    robot.place(column: 0, row: 0, direction: 'NORTH')
    robot.move
    robot.move
    robot.right
    robot.move
    robot.left
    robot.move
    expect(robot.report).to eq([1,3,"NORTH"])
  end
end
