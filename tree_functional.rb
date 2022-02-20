add = -> (left, right) { left + right }
sub = -> (left, right) { left - right }
mul = -> (left, right) { left * right }
div = -> (left, right) { left / right }

add_s = -> (left, right) { "(#{left} + #{right})" }
sub_s = -> (left, right) { "(#{left} - #{right})" }
mul_s = -> (left, right) { "(#{left} x #{right})" }
div_s= -> (left, right)  { "(#{left} ÷ #{right})" }

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

assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", div_s.call(add_s.call(num(7),mul_s.call(sub_s.call(num(3),num(2)),num(5))),num(6))
assert_equal 2, div.call(add.call(num(7),mul.call(sub.call(num(3),num(2)),num(5))),num(6))
