class Problem
  A_MAX = 10
  B_MAX = 10
  UPPER_LIMIT = 100

  def initialize
    @prime_net = []

    @prime_params = []
    p loop_though
    p @prime_params
  end

  def loop_though
    max_a = 0
    max_b = 0
    max_length = 0
    (-A_MAX...A_MAX).each do |a|
      (-B_MAX...B_MAX).each do |b|
        length = quadratic_prime_length(a, b)
        @prime_params << Array.new([a, b, length])
        if length > max_length
          max_length = length
          max_a = a
          max_b = b
        end
      end
    end
    max_a * max_b # return the product of a, b
  end

  def quadratic_prime_length(a, b)

    # if b is not a prime then it will fail at n = 0
    return 0 unless is_prime?(b)

    count = 0
    (0...UPPER_LIMIT).each do |n|
      p "#{n}^2 + #{a*n} + #{b}"
      value = prime_equation(a, b, n)
      break unless is_prime?(value)
      count = count + 1
      p "#{value} is prime"
    end
    count
  end

  def prime_equation(a, b, n)
    n**2 + a*n + b
  end

  def is_prime?(value)
    value = value.abs if value < 0

    return false if value == 0 || value == 1

    unless @prime_net.empty?
      @prime_net.each do |prime|
        return false if value % prime == 0 # optimization
      end
    end

    (2...value).each do |int|
      return false if value % int == 0 # brute force
    end

    @prime_net << value
    true
  end
end

Problem.new
