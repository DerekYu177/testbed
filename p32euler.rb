class Problem32
  #pandigital problem
  def initialize
    # the most straightforward way is to use brute force
    # we can skip all numbers where:
      # len(a) + len(b) + len(a*b) != 9.
        # Since len(a*b) = len(a) + len(b)
        # len(b).max = (9 - 2*len(a))/2.ceil
        # len(b).min = (9 + 1 - 2*len(a))/2.floor
      # we can skip b if b contains repeated numbers
      # we can skip b if b contains numbers in a
      # we can skip a*b if it contains numbers in a, b
    max_number = 999999999
    max_length = max_number.to_s.length

    unique_products = []

    (2...max_number).each do |a|
      b_max_length = (((9 - 2*(a.to_s.length))/2.0).ceil)
      b_min_length = (((9 + 1 - 2*(a.to_s.length))/2.0).floor)

      break if b_max_length < 0 || b_min_length < 0

      b_max = ("9"*b_max_length).to_i
      b_min = ("1"*b_min_length).to_i

      (b_min...b_max).each do |b|

        break if a.to_s.length > b.to_s.length

        next if contains_0?(b)
        next unless is_all_unique?(b)
        next if common_numbers?(a, b)
        c = a * b
        next if contains_0?(c)
        next if common_numbers?(a, b, c)
        next unless is_total_len_9?(a, b, c)
        next unless is_all_unique?(a, b, c)
        next unless contains_1_9?(a, b, c)
        debug(a, b, c)

        unique_products << c unless unique_products.include?(c)
        p unique_products
      end
    end
    solution = unique_products.reduce(:+)
    p "Solution is: #{solution}"
  end

  def common_numbers?(a, b, *c)
    a_array = a.to_s.split("")
    b_array = b.to_s.split("")
    return false if a_array.include? b_array
    common = a_array && b_array

    unless c.empty?
      c_array = int_to_int_array(c)
      common = common && c_array
    end

    common.empty?
  end

  def is_total_len_9?(a, b, c)
    a_length = a.to_s.length
    b_length = b.to_s.length
    c_length = c.to_s.length

    a_length + b_length + c_length == 9
  end

  def debug(a, b, *c)
    if c.empty?
      p "a: #{a}, b: #{b}"
    else
      p "a: #{a}, b: #{b}, c: #{c}"
    end
  end

  def is_all_unique?(a, *other)
    combined = a.to_s.split("")

    unless other.empty?
      b = other[0]
      c = other[1]
      combined = (a.to_s + b.to_s + c.to_s).split("")
    end

    combined == combined.uniq
  end

  def contains_1_9?(a, b, c)
    combined = int_to_int_array(a.to_s + b.to_s + c.to_s)
    full = [1,2,3,4,5,6,7,8,9]
    full & combined == full
  end

  def contains_0?(number)
    number.to_s.split("").each do |i|
      return true if i == "0"
    end
    false
  end

  def int_to_int_array(integer)
    integer.to_s.split("").map{ |i| i.to_i }
  end
end

Problem32.new
