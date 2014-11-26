class Board
  class InvalidSize < Exception; end
  class InvalidSquares < Exception; end

  PLAYERS = ['X', 'O']
  SIZE = 3

  def initialize(board = Array.new(SIZE) { Array.new(SIZE) })
    raise InvalidSize unless board.length == SIZE

    raise InvalidSize unless board.all? {|r| r.length == SIZE}

    raise InvalidSquares unless board.all? {|r| r.all? {|s| s.nil? || PLAYERS.include?(s)}}

    @rows = board
  end

  def full?
    rows.all? {|r| r.none? {|square| square.nil?}}
  end

  def winner
    PLAYERS.each do |player|
      [diagonals, columns, rows].each do |triples|
        return player if triples.any? {|triple| triple.all? {|square| square == player}}
      end
    end
    return nil
  end

  private

  attr_reader :rows

  def columns
    SIZE.times.map do |idx|
      rows.map{|row| row[idx]}
    end
  end

  def diagonals
    [[rows[0][0], rows[1][1], rows[2][2]],
    [rows[0][2], rows[1][1], rows[2][0]]]
  end
end
