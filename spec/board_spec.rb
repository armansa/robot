require './src/board'

describe Board do
 it "checks boundry of a board" do
   board = Board.new
	 board.check_boundry(0,0).should be_true
	 board.check_boundry(5,5).should be_false
 end
end
