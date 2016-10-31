class Problem

  ERROR = 1E-3

  def initialize(limit)
    @UPPER_LIMIT = limit
    find_answer
  end

  def repetitive_length(number) # decimal input
    number.to_s.length.times do |i| # i is the number of repeated digits
      next if i == 0

      # if result is a whole number (followed by 0's), then we have the right number
      result = ((number*10**i) - number) % 1
      error = 1 - result

      p error

      return i if error < ERROR
    end
  end

  def recripocate(n)
    return 1/n.to_f unless n == 0 # basic error handling for NaN
  end

  def find_answer
    max_length = 0
    (2...@UPPER_LIMIT).each do |i|
      length = repetitive_length(recripocate(i))

      p "n:#{i}, length:#{length}"

      max_length = length if max_length > length
    end
  end
end

Problem.new(10)
