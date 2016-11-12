class Problem30
  def initialize(power)
    @power = power
    p search_n_powers
  end

  def search_n_powers
    # start searching from "1"*power to "9"*power

    #i.e. if power = 3
    # 100a + 10b + c = a**3 + b**3 + c**3; a,b,c in [0,9]
    # upper limit calculated from RHS

    upper_bound = @power * 9**@power

    sum = 0

    (2..upper_bound).each do |number|
      if number == sum_individual_digits_power(number)
        sum = sum + number
        p number
      end
    end

    sum
  end

  def sum_individual_digits_power(number)
    sum = 0
    number.to_s.each_char do |integer|
      sum = sum + (integer.to_i)**@power
    end
    sum
  end
end

Problem30.new(5)
