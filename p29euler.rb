class Problem29
  LOWER_LIMIT = 2

  def initialize(a, b)
    p solution(a, b)
  end

  def solution(a, b)
    arr = []
    (LOWER_LIMIT..a).each do |a_|
      (LOWER_LIMIT..b).each do |b_|
        p "a: #{a_}, b: #{b_}"
        arr << a_ ** b_
      end
    end
    arr.uniq!
    arr.length
  end
end

Problem29.new(100, 100)
