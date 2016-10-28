@TERMINATING_NUMBER = 1
@previously_computed = {}

def n_even(n)
  n/2
end

def n_odd(n)
  3*n+1
end

def collatz_sequence_length(number, length)
  return length if number == @TERMINATING_NUMBER
  length = collatz_sequence_length(n_even(number), length+1) if number.even?
  length = collatz_sequence_length(n_odd(number), length+1) if number.odd?
  @previously_computed[number] if @previously_computed.key?(number)
  length
end


max_seed = 0
max_length = 0

(1...1000000).each do |number|
  length = collatz_sequence_length(number, 1)
  @previously_computed[number] = length

  if length > max_length
    max_seed = number
    max_length = length
  end
  s = "[%9s]" % number
  l = "[%9s]" % length
  ms = "[%9s]" % max_seed
  ml = "[%9s]" % max_length
  p "#{s} #{l} #{ms}, #{ml}"
git end
