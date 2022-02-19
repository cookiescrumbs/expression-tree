class Node
  attr_accessor :value, :operator

  def initialize(value: false, operator: false)
    @operator = operator
    @value = value
  end

  def result 
    return run_operation if @operator
    @value
  end

  def set_left(node)
    @left = node
  end

  def set_right(node)
    @right = node
  end

  def move_left
    @left
  end

  def move_right
    @right
  end

  def to_s
    return operation_as_string if @operator
    @value.to_s
  end 

  private

  def run_operation
    @left.result.send(@operator, @right.result)
  end

  def operation_as_string
    OperationAsString.send @operator, @left.to_s, @right.to_s
  end
end

module OperationAsString
  def self.*(left, right)
    "(#{left} x #{right})"
  end

  def self./(left, right)
    "(#{left} ÷ #{right})"
  end

  def self.+(left, right)
    "(#{left} + #{right})"
  end

  def self.-(left, right)
    "(#{left} - #{right})"
  end
end


tree = Node.new(operator: '/')

tree.set_left(Node.new(operator: '+'))

tree.move_left.set_left(Node.new(value: 7))
tree.move_left.set_right(Node.new(operator: '*'))

tree.move_left.move_right.set_left(Node.new(operator: '-'))
tree.move_left.move_right.move_left.set_left(Node.new(value:3))
tree.move_left.move_right.move_left.set_right(Node.new(value:2))

tree.move_left.move_right.set_right(Node.new(value: 5))

tree.set_right(Node.new(value: 6))


def assert_equal(expected, actual)
  if expected != actual
    puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
    exit 1
  else
    puts "passsed"
  end
end

assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree.to_s
assert_equal 2, tree.result