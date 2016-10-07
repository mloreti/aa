class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    assigned = false
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        assigned = true
      end
    end
    @map << [key, value] unless assigned
  end

  def lookup(key)
    @map.each do |pair|
      if pair[0] == key
        return pair[1]
      else
        return nil
      end
    end
  end

  def remove(key)
    @map.each_with_index do |pair, i|
      if pair[0] == key
        @map.delete_at(i)
      end
    end
  end

  def show
    @map
  end

end

m = Map.new

m.assign("Name", "Mickey")
p m.show
m.remove("Name")
p m.show
