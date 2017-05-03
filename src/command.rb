class Command
  attr_accessor :title, :args, :column, :row, :direction

  VALID_COMMANDS = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']
  VALID_DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def parse line
    parts = line.split ' '
    self.title = parts[0]
    if parts[1]
      self.args = parts[1].split ','
      self.column = args[0].to_i
      self.row = args[1].to_i
      self.direction = args[2]
    end
    self
  end

  def valid_placement?
    self.title == 'PLACE' &&
    self.column.is_a?(Integer) &&
    self.row.is_a?(Integer) &&
    VALID_DIRECTIONS.include?(self.direction)
  end

  def valid?
    VALID_COMMANDS.include?(self.title) && ( valid_placement? || self.args.nil? )
  end
end
