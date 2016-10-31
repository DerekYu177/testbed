class Problem

  ERROR = 1E-3

  def initialize(limit)
    @UPPER_LIMIT = limit
    find_answer
  end

  def repetitive_length(number) # decimal input
    n = number.to_s[2..-1] # remove "0."

    return 0 if n.length == 1 # handles where there is no reptition

    n.length.times do |index|
      if n[index] == n[0]
        (index).times do |i|
          return index if n[index + i] == n[i]
        end
      end
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
