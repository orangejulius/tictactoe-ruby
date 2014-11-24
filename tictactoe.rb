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
      return player if @rows.any? {|row| row.all? {|square| square == player}}
    end
    return nil
  end
end
