# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(x)
  # write your code in Ruby 2.2

  # our approach is to start from the beginning to the end
  # if the rounded up value is less than the preceeding value
  # then we can ignore it. i.e. 6, 2 -> 4. 4 < 6 therefore discard

  x_as_array = int_to_array(x)

  x_as_array.each_with_index do |_, index|

    next if index + 1 > x_as_array.length # making sure we don't go out of bounds
    next if x_as_array[index] > x_as_array[index + 1]

    replacer = round_up_average(x_as_array[index], x_as_array[index + 1])
    next if replacer < x_as_array[index]

    x_as_array = replace(x_as_array, index, index + 1, replacer)
    return array_to_int(x_as_array)
  end
end

def int_to_array(x)
  string_arr = x.to_s.split("")
  int_arr = []
  string_arr.each do |str|
    int_arr << str.to_i
  end
  int_arr
end

def round_up_average(a, b)
  ((a + b)/2.to_f).ceil
end

def array_to_int(a)
  a.join.to_i
end

def replace(array, index_a, index_b, replaced)
  array[index_a] = replaced
  array.delete_at(index_b)
  array
end

p solution(623315)

# p replace([1, 2, 3, 4], 2, 3, 5)
