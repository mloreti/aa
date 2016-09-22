require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2
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
    # debugger
    in_hand = @cups[start_pos]

    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    # distributes stones
    counter = start_pos
    until in_hand.empty?
      counter += 1
      counter = 0 if counter > 13
      # places stones in the correct current player's cups
      if counter == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif counter == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[counter] << stones.pop
      end
    end
    render
    next_turn(counter)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end

  end
end
