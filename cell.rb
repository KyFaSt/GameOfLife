require 'pry'

class Cell
  def initialize(x, y, alive)
    @x = x
    @y = y
    @alive = alive
  end

  def x
    @x
  end

  def y
    @y
  end

  def alive
    @alive
  end

  def neighbors
   [ Cell.new(self.x, self.y-1, false), Cell.new(self.x, self.y+1, false),
     Cell.new(self.x-1, self.y-1, false), Cell.new(self.x-1, self.y, false), Cell.new(self.x-1, self.y+1, false),
     Cell.new(x+1, y-1, false), Cell.new(self.x+1, self.y, false), Cell.new(self.x+1, self.y+1, false)
   ]
  end

  def to_s
    if alive
      'x'
    else
      ' '
    end
  end
end
