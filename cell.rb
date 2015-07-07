require 'pry'
require 'gemoji'

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
      monkey
    else
      ' '
    end
  end

  def monkey
    Emoji.find_by_alias("monkey").raw
  end
end
