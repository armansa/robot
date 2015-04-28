require './src/board'
require './src/robot'

describe Robot do
 it "runs robot actions" do
   board = Board.new
   robot = Robot.new board
	 robot.place 0, 0, 'NORTH'
	 robot.move
	 robot.move
	 robot.right
	 robot.move
	 robot.left
	 robot.move
	 robot.report.should eq([1,3,"NORTH"])
 end
end
