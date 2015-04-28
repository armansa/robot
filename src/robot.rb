require './src/board'

class Robot

  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']
	DIRECTIONS_INDEX = {'NORTH'=>0, 'EAST'=>1, 'SOUTH'=>2, 'WEST'=>3}
	DIRECTIONS_STEPS = [[0,1], [1,0], [0,-1], [-1,0]]

	def initialize b
	  @board = b
	end

	def placed_on_board
	  @col && @row &&
		DIRECTIONS_INDEX[@direction] &&
		@board.check_boundry(@col, @row) 
	end

  def place c, r, d
	  (@col, @row, @direction) = [c.to_i, r.to_i, d]
		nil
	end

  def move
	  return nil unless placed_on_board
	  col = @col + DIRECTIONS_STEPS[DIRECTIONS_INDEX[@direction]][0]
	  row = @row + DIRECTIONS_STEPS[DIRECTIONS_INDEX[@direction]][1]
		(@col,@row) = [col,row] if @board.check_boundry col, row
		nil
	end

	def right
	  return nil unless placed_on_board
	  @direction = DIRECTIONS[(DIRECTIONS_INDEX[@direction]+1)%4]
		nil
	end

	def left
	  return nil unless placed_on_board
	  @direction = DIRECTIONS[(DIRECTIONS_INDEX[@direction]+3)%4]
		nil
	end

	def report
	  return nil unless placed_on_board
	  [@col, @row, @direction]
	end
end
