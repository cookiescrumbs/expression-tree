class Div 
  def initialize(left, right)
    @right = right
    @left = left
  end

  def run
    @left.run / @right.run
  end

  def print
    "(#{@left.print} ÷ #{@right.print})"
  end
end

class Add   
  def initialize(left, right)
    @right = right
    @left = left
  end

  def run
    @left.run + @right.run
  end

  def print
    "(#{@left.print} + #{@right.print})"
  end
end
class Sub
  def initialize(left, right)
    @right = right
    @left = left
  end
  
  def run
    @left.run - @right.run
  end

  def print
    "(#{@left.print} - #{@right.print})"
  end
end
class Mul
  def initialize(left, right)
    @right = right
    @left = left
  end

  def run
    @left.run * @right.run
  end

  def print 
    "(#{@left.print} x #{@right.print})"
  end
end
class Num 
  def initialize(value)
    @value = value
  end

  def run
    @value
  end

  def print 
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
assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree.print
assert_equal 2, tree.run




