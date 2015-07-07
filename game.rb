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
end

class Game
  def initialize(seed, generations)
    @generations = generations
    @cells = seed
  end

  def cells
    @cells
  end

  def live_cells
    @cells.select{|cell| cell.alive}
  end

  def live_neighbors(cell)
    cell.neighbors.map {|n| live_cells.select {|c| c.x == n.x && c.y == n.y }}.flatten
  end

  def live_neighbors_count(cell)
    live_neighbors(cell).count
  end

  def next_cell(cell)
    if cell.alive && (2..3).include?(live_neighbors_count(cell)) || 3 == live_neighbors_count(cell)
      Cell.new(cell.x, cell.y, alive = true)
    else
      Cell.new(cell.x, cell.y, alive = false)
    end
  end

  def next_generation
    next_cells = []
    @cells.map{|cell| next_cells.push(next_cell(cell))}
    @cells = next_cells
  end
end
