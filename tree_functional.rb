def add(left, right)
  left + right 
end

def sub(left, right)
  left - right
end

def mul(left, right)
  left * right
end

def div(left, right)
  left / right
end

def num(value) 
  value
end


def assert_equal(expected, actual)
  if expected != actual
    puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
    exit 1
  else
    puts "passsed"
  end
end

# assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)",
assert_equal 2, div(add(num(7),mul(sub(num(3),num(2)),num(5))),num(6))
