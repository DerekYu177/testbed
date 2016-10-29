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

sum = 0
(1...10000).each do |number|
  a = d(number)
  b = d(a)
  next if a == b || number != b
  p number
  sum = sum + number
end
p sum
