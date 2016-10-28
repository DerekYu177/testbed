class Problem
  def initialize
    path_to_file = "~/Documents/workspace/testbed/p13euler_data.txt"
    sum_of_10_digits = sum_10(path_to_file)
    p (sum_of_10_digits.to_s)[0...10]
  end

  def sum_10(path_to_file)
    File.open(path_to_file, "r") do |f|
      sum = 0
      f.each_line do |line|
        sum = sum + first_10_digits(line)
      end
      sum
    end
  end

  def first_10_digits(number)
    truncated_number = number[0...100]
    truncated_number.to_i # number input is type String
  end
end

Problem.new
