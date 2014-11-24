require 'minitest/spec'
require 'minitest/autorun'

require_relative 'tictactoe'

describe Board do
  it 'can be constructed with a 2d array' do
    Board.new([[nil, nil, nil], ['X', 'O', 'X'], [nil, 'O', 'X']])
  end

  it 'enforces the number of board rows is 3' do
    assert_raises Board::InvalidSize do
      Board.new([1])
    end
  end

  it 'raises an error unless each row has 3 columns' do
    assert_raises Board::InvalidSize do
      Board.new([[1], [2, 3], [4, 5, 3]])
    end
  end

  it 'checks that each square contains X, O, or nil' do
    assert_raises Board::InvalidSquares do
      Board.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  it 'defaults to an empty board' do
    b = Board.new
  end

  it 'knows when the board is full' do
    b = Board.new Array.new(3) {Array.new(3, 'O')}

    assert b.full?
  end

  it 'knows when the board is not full' do
    b = Board.new

    refute b.full?
  end
end
