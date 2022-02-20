
def tree(print: false)
  add = -> (left, right) { print ? "(#{left} + #{right})" : left + right }
  sub = -> (left, right) { print ? "(#{left} - #{right})" : left - right }
  mul = -> (left, right) { print ? "(#{left} x #{right})" : left * right }
  div = -> (left, right) { print ? "(#{left} ÷ #{right})" : left / right }
  num = -> (value) { value }
  
  div.(add.(num.(7),mul.(sub.(num.(3),num.(2)),num.(5))),num.(6))
end


def assert_equal(expected, actual)
  if expected != actual
    puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
    exit 1
  else
    puts "passsed"
  end
end

assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree(print: true)
assert_equal 2, tree
