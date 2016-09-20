require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @name1 = name1
    @name2 = name2
    @current_player = @name1
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |i|
      stones = [:stone, :stone, :stone, :stone]
      @cups[i] = stones unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise Exception.new "Invalid starting cup" unless (1..12).include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    in_hand = @cups[start_pos]

    @cups[start_pos] = []
    counter = start_pos + 1

    in_hand.each do |stone|
      @cups[counter] << stone
      counter += 1
    end
    render
    next_turn(counter)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    @cups[ending_cup_idx].empty?
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
  end

  def winner
  end
end
