class Problem31
  VALUES = {
  :a => 1,
  :b => 2,
  :c => 5,
  :d => 10,
  :e => 20,
  :f => 50,
  :g => 100,
  :h => 200
}

  def initialize(goal)
    @goal = goal
    @bag = {}
    initialize_bag
    require "pry";binding.pry;:Derek
  end

  def initialize_bag
    VALUES.each_key do |coin_rep|
      @bag[coin_rep] = VALUES[coin_rep] unless VALUES[coin_rep] > @goal
    end
  end

  def populate_bag
    @bag.each do |pocket, value|
      @bag[pocket] = {}
    end
  end

  def iterate_pocket(upper_layer)
    return if is_complete?(upper_layer)
    VALUES.each_key do |coin|
      new_value = value(upper_layer) + VALUES[coin]
      upper_layer[coin] = new_value unless new_value > @goal
    end
  end

  def flatten_bag
    
  end

  def value(pocket)
    sum = 0
    pocket.to_s.each_char do |char|
      sum = sum + VALUES[char]
    end
  sum
  end

  def is_complete?(pocket)
    value(pocket) == @goal
  end
end

Problem31.new(200)
