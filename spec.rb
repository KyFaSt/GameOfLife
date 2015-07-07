require 'rspec'
require 'pry'
require './game.rb'

describe Cell do
  it "should initialize a new cell" do
    cell = Cell.new(-1, 1, false)
    expect(cell.alive).to eq(false)
  end

  it "should know it has eight neighbors" do
    cell = Cell.new(-1, 1, true)
    expect(cell.neighbors.count).to eq(8)
  end
end

