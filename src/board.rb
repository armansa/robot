class Board
  attr_accessor :width, :height

  def initialize(width:, height:)
    self.width = width
    self.height = height
  end

  def check_boundry(column:, row:)
    column >= 0 && column < self.width && row >= 0 && row < self.height
  end
end
