def sum_of_number(number)
  sum = 0
  s_number = number.to_s
  s_number.each_char do |digit|
    sum = sum + digit.to_i
  end
  sum
end

exp = 1000
number = 2**exp
n = "%100s" % number
s = "%100s" % sum_of_number(number)
p "#{n}, #{s}"
