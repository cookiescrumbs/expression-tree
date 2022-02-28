class Div 
  def initialize(left, right)
    @right = right
    @left = left
  end

  def result
    @left.result / @right.result
  end

  def to_s
    "(#{@left.to_s} ÷ #{@right.to_s})"
  end
end

class Add   
  def initialize(left, right)
    @right = right
    @left = left
  end

  def result
    @left.result + @right.result
  end

  def to_s
    "(#{@left.to_s} + #{@right.to_s})"
  end
end
class Sub
  def initialize(left, right)
    @right = right
    @left = left
  end
  
  def result
    @left.result - @right.result
  end

  def to_s
    "(#{@left.to_s} - #{@right.to_s})"
  end
end
class Mul
  def initialize(left, right)
    @right = right
    @left = left
  end

  def result
    @left.result * @right.result
  end

  def to_s 
    "(#{@left.to_s} x #{@right.to_s})"
  end
end
class Num 
  def initialize(value)
    @value = value
  end

  def result
    @value
  end

  def to_s 
    @value
  end

end

def assert_equal(expected, actual)
  if expected != actual
    puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
    exit 1
  else
    puts "passsed"
  end
end

tree = Div.new(Add.new(Num.new(7),Mul.new(Sub.new(Num.new(3),Num.new(2)),Num.new(5))), Num.new(6))
assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree.to_s
assert_equal 2, tree.result




