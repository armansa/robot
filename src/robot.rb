require './src/board'

class Robot
  attr_accessor :board, :column, :row, :direction

	RIGHT_TURN = {'NORTH'=>'EAST', 'EAST'=>'SOUTH', 'SOUTH'=>'WEST', 'WEST'=>'NORTH'}
	LEFT_TURN =  {'NORTH'=>'WEST', 'EAST'=>'NORTH', 'SOUTH'=>'EAST', 'WEST'=>'SOUTH'}
  DIRECTIONS_STEPS = {
    'NORTH' => {column: 0, row: 1},
    'EAST'  => {column: 1, row: 0},
    'SOUTH' => {column: 0, row: -1},
    'WEST'  => {column: -1, row: 0}
  }

	def initialize(board:)
	  self.board = board
	end

  def run(command:, output:)
    case command.title
    when 'PLACE'
      place(column: command.column, row: command.row, direction: command.direction)
    when 'REPORT'
      output.puts report.join(',')
    when 'LEFT'
      left
    when 'RIGHT'
      right
    when 'MOVE'
      move
    end
  end

	def placed_on_board
	  !self.column.nil? && !self.row.nil? && !self.direction.nil? &&
		self.board.check_boundry(column: self.column, row: self.row)
	end

  def place(column:, row:, direction:)
	  (self.column, self.row, self.direction) = [column, row, direction]
	end

  def move
	  return nil unless placed_on_board
	  column = self.column + DIRECTIONS_STEPS[self.direction][:column]
	  row = self.row + DIRECTIONS_STEPS[self.direction][:row]
		(self.column, self.row) = [column, row] if self.board.check_boundry(column: column, row: row)
	end

	def right
	  return nil unless placed_on_board
	  self.direction = RIGHT_TURN[self.direction]
	end

	def left
	  return nil unless placed_on_board
	  self.direction = LEFT_TURN[self.direction]
	end

	def report
	  return nil unless placed_on_board
	  [self.column, self.row, self.direction]
	end
end
