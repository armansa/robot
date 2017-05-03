require './src/board'
require './src/robot'
require './src/command'

class Cli #command line interface
  def initialize input, output
    board = Board.new(width: 5, height: 5)
    robot = Robot.new(board: board)
    input.each do |line|
      line = line.squeeze(' ').strip.upcase
      command = Command.new.parse line
      if command.valid?
        robot.run(command: command, output: output)
      end
    end
  end
end
