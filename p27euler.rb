class Problem
  A_MAX = 1000
  B_MAX = 1000
  UPPER_LIMIT = 100

  def initialize
    @prime_net = []
    @prime_params = []
    @max_length = 0

    initialize_prime_params

    p loop_though
    p @prime_params
  end

  def loop_though
    max_a = 0
    max_b = 0
    (-A_MAX...A_MAX).each do |a|
      (-B_MAX...B_MAX).each do |b|
        length = quadratic_prime_length(a, b)

        if length > @max_length
          p [a, b, length]
          @prime_params << Array.new([a, b, length])
          @max_length = length
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
    iterator = 0
    while is_prime?(prime_equation(a, b, iterator))
      count = count + 1
      iterator = iterator + 1
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
        next if prime >= value
        return false if value % prime == 0 # optimization
      end
    end

    (2...value).each do |int|
      return false if value % int == 0 # brute force
    end

    @prime_net << value unless @prime_net.include?(value)
    true
  end

  def initialize_prime_params
    (0...1000).each do |int|
      is_prime?(int)
    end
  end
end

Problem.new
