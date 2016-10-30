
UPPER_LIMIT = 28123
SMALLEST_ABUNDANT = 12

def factorize(number)
  arr = []
  (1...number).each do |possible_factors|
    arr << possible_factors if (number % possible_factors == 0) # factor
  end
  arr
end

def sum(array)
  array.reduce(0, :+)
end

def d(number)
  sum(factorize(number))
end

def abundant?(number)
  true if d(number) > number
end

def sum_abundant_numbers?(number)
  ceiling = (number/2).ceil
  (SMALLEST_ABUNDANT...ceiling).each do |n|
    next unless abundant?(number - n)
    next unless abundant?(n)
    return true
  end
end

abundant_length = 0
deficient_length = 0

# shows that there are roughly 3x the number of deficits as opposed to abundnts
(1...UPPER_LIMIT).each do |number|
  abundant?(number) ? abundant_length = abundant_length + 1 : deficient_length = deficient_length + 1
  puts "a:#{abundant_length}, d:#{deficient_length}"
end

p sum
