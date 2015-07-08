require 'rspec'
require 'pry'
require './game.rb'

describe Cell do
  it "can initialize a new cell" do
    cell = Cell.new(-1, 1, false)
    expect(cell.alive).to eq(false)
  end

  it "knows it has eight neighbors" do
    cell = Cell.new(-1, 1, true)
    expect(cell.neighbors.count).to eq(8)
  end
end

describe Game do
  context "with a valid seed and number of generations provided" do
    let(:seed) { [Cell.new(-1, 1, false), Cell.new(0, 1, false), Cell.new(1, 1, false), Cell.new(-1, 0, true), Cell.new(0, 0, true), Cell.new(1, 0, true), Cell.new(-1, -1, false), Cell.new(0, -1, false), Cell.new(1, -1, false)]}
    it "can initialize a game" do
      game = Game.new(seed, 3)
      expect(game.cells).to eq(seed)
      expect(game.live_cells.count).to eq(3)
    end

    it "will evolve a two phase seed to the next generation" do
      game = Game.new(seed, 1)
      game.next_generation
      second_generation = game.live_cells

      expect(second_generation.count).to eq(3)

      expect(second_generation[0].x).to eq(0)
      expect(second_generation[0].y).to eq(1)

      expect(second_generation[1].x).to eq(0)
      expect(second_generation[1].y).to eq(0)

      expect(second_generation[2].x).to eq(0)
      expect(second_generation[2].y).to eq(-1)
    end
  end
end
