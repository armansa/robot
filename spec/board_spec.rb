require './src/board'

describe Board do
 it "checks boundry of a board" do
   board = Board.new(width: 5, height: 5)
	 expect(board.check_boundry(column: 0, row: 0)).to be true
	 expect(board.check_boundry(column: 5, row: 5)).to be false
 end
end
