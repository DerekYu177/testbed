# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
#
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?


# is a tree problem
# we begin with the root case, which is @amount
# we subtract a denomination from root, and increment combination. This is the new root
#

class Combination
  def initialize(amount)
    @combinations = {
      1 => 0,
      2 => 0,
      5 => 0,
      10 => 0,
      20 => 0,
      50 => 0,
      100 => 0,
      200 => 0
    }
    @coins_used = 0
    @amount_remainder = amount
  end

  def subtract(coin_value)
    @amount_remainder = @amount_remainder - coin_value
    @combinations[coin_value] = @combinations[coin_value] + 1
    @coins_used = @coins_used + 1
  end

  def is_complete?
    @amount_remainder == 0
  end

  def value
    @amount_remainder
  end

  def combinations
    @combinations
  end
end

class Problem31
  COINS = [1, 2, 5, 10, 20, 50, 100, 200]

  def initialize(amount)
    @amount = amount
    @solution_tree = []
  end

  def tree_setup
    new_combination_per_coin(@amount)
  end

  def iterate_tree_branch
    @solution_tree.each do |potential_solution|
      unless potential_solution.is_complete?
        root = potential_solution.value
        new_combination_per_coin(root)

      end
    end

  end

  def new_combination_per_coin(root)
    COINS.each do |coin|
      sub_branch = Combination.new(root)
      sub_branch.subtract(coin)
      @solution_tree << sub_branch
    end
  end

  def remove_non_unique_combinations
    # having a problem with this one
  end
end

Problem31.new(2)
