class Board
  def initialize w=5, h=5
	  @width = w
	  @height = h
	end

	def check_boundry c, r
	  c >=0 && c < @width && r >=0 && r < @height
	end
end
