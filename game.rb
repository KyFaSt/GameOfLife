require 'pry'
require './cell.rb'
class Game
  def initialize(seed, generations)
    @generations = generations
    @cells = seed
  end

  def cells
    @cells
  end

  def play
    (1..@generations).each do
      next_generation
      puts self
    end
  end

  def live_cells
    @cells.select{|cell| cell.alive}
  end

  def live_neighbors(cell)
    cell.neighbors.map {
      |neighbor| live_cells.select {
        |live_cell| live_cell.x == neighbor.x && live_cell.y == neighbor.y
      }
    }.flatten
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

  def play
    (1..@generations).each do
      next_generation
      print_board
    end
  end

  def print_board
    row_location.each do |row_location|
      row = @cells.select{|cell| cell.x == row_location}
      puts row.join
    end
  end

  def row_location
    @cells.map{|cell| cell.x}.uniq
  end
end


blinker = [Cell.new(-1, 1, false), Cell.new(0, 1, false), Cell.new(1, 1, false),
           Cell.new(-1, 0, true), Cell.new(0, 0, true), Cell.new(1, 0, true),
           Cell.new(-1, -1, false), Cell.new(0, -1, false), Cell.new(1, -1, false)]

toad = [Cell.new(-1, 1, false), Cell.new(0, 1, false), Cell.new(1, 1, false), Cell.new(2, 1, false), Cell.new(3, 1, false),
        Cell.new(-1, 0, false), Cell.new(0, 0, true), Cell.new(1, 0, true), Cell.new(2, 0, true),Cell.new(3, 1, false),
        Cell.new(-1, -1, true), Cell.new(0, -1, true), Cell.new(1, -1, true), Cell.new(2, -1, false), Cell.new(3, -1, false),
        Cell.new(-1, -2, false), Cell.new(0, -2, false), Cell.new(1, -2, false), Cell.new(2, -2, false), Cell.new(3, -2, false),
        Cell.new(-1, -3, false), Cell.new(0, -3, false), Cell.new(1, -3, false), Cell.new(2, -3, false), Cell.new(3, -3, false)
       ]

Game.new(toad, 300).play
