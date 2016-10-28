class Problem
  def initialize
    @filename = __dir__ + "/p18euler_data.txt"
    p maximum_path_sum(@filename)
  end

  def maximum_path_sum(filename)
    @sum = 0
    @index = 0
    File.open(filename, "r") do |f|
      f.each_line do |line|
        # p "before: #{@index}, #{@sum}"
        select_maximum(line.split)
        # p "after: #{@index}, #{@sum}"
        p @sum
      end
    end
    @sum
  end

  def select_maximum(line_as_array)
    if @sum == 0 # ensures intial condition
      @sum = line_as_array[@index].to_i
      return
    end
    left = @index
    right = @index + 1
    # p "left: #{line_as_array[left]}, right: #{line_as_array[right]}"
    if line_as_array[left].to_i > line_as_array[right].to_i
      @sum = @sum + line_as_array[left].to_i
      p "selected: #{line_as_array[left].to_i}"
    else
      @sum = @sum + line_as_array[right].to_i
      @index = @index + 1
      p "selected: #{line_as_array[right].to_i}"
    end
  end
end

Problem.new
