require './src/board'
require './src/robot'

class Cli #command line interface
  def initialize input, output
	  board = Board.new 
		robot = Robot.new board
	  input.each do |line|
		  line.chomp! 
		  parts = line.partition ' '
      method = parts[0].downcase
			args = parts[2].split ','
			result = robot.send method, *args
			if result and method=='report'
			  output.puts result.join ','
			end
		end
	end
end
