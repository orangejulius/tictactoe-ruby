class Board
  class InvalidSize < Exception; end
  class InvalidSquares < Exception; end

  def initialize(board = Array.new(3) { Array.new(3) })
    raise InvalidSize unless board.length == 3

    raise InvalidSize unless board.all? {|r| r.length == 3}

    raise InvalidSquares unless board.all? {|r| r.all? {|s| ['X', 'O', nil].include? s}}

    @rows = board
  end

  def full?
    @rows.all? {|r| r.none? {|square| square.nil?}}
  end

  def winner
    ['X', 'O'].each do |player|
      diagonals.each do |d|
        return player if d.all? {|square| square == player}
      end
      [0, 1, 2].each do |col|
        return player if @rows.all? {|row| row[col] == player }
      end
      return player if @rows.any? {|row| row.all? {|square| square == player}}
    end
    return nil
  end

  private

  def diagonals
    [[@rows[0][0], @rows[1][1], @rows[2][2]],
    [@rows[0][2], @rows[1][1], @rows[2][0]]]
  end
end
