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

  describe 'winner' do
    it 'returns nil when the board is empty' do
      b = Board.new

      assert_nil b.winner
    end

    it 'returns X if one whole row contains only Xs' do
      b = Board.new([['X', 'X', 'X'], [nil, nil, nil], [nil, nil, nil]])

      assert_equal 'X', b.winner
    end

    it 'returns O if one whole row contains only Os' do
      b = Board.new([['O', 'O', 'O'], [nil, nil, nil], [nil, nil, nil]])

      assert_equal 'O', b.winner
    end

    it 'returns X if one whole column contains only Xs' do
      b = Board.new(Array.new(3) { ['X', nil, nil]})

      assert_equal 'X', b.winner
    end

    it 'returns O if one whole column contains only Xs' do
      b = Board.new(Array.new(3) { ['O', nil, nil]})

      assert_equal 'O', b.winner
    end
  end

end
