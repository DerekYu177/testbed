class Problem
  CORNERS = 4

  def initialize(spiral_side_size)
    @spiral_side_size = spiral_side_size

    p spiral_sum
  end

  def spiral_sum
    sum = 0
    (1..@spiral_side_size).step(2) do |spiral_size|
      p "spiral_size: #{spiral_size}"
      sum = sum + circle_sum(spiral_size)
    end
    sum
  end

  def circle_sum(side_size)
    return 1 if side_size == 1

    sum = 0
    (1..CORNERS).each do |corner|
      p "corner_value: #{corner_value(corner,side_size)}"
      sum = sum + corner_value(corner, side_size)
    end
    sum
  end

  def corner_value(corner, side_size)
    distance_between_corners = side_size - 1
    seed_value = last_value_in_previous_circle(side_size)

    seed_value + distance_between_corners * corner
  end


  def last_value_in_previous_circle(side_size)
    (side_size-2)**2
  end
end

Problem.new(1001)
