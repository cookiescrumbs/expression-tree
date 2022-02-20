const assert = require('assert');

const add = (left, right) => (p=false) => p ? `(${left(p)} + ${right(p)})` : left() + right();
const sub = (left, right) => (p=false) => p ? `(${left(p)} - ${right(p)})` : left() - right();
const mul = (left, right) => (p=false) => p ? `(${left(p)} x ${right(p)})` : left() * right();
const div = (left, right) => (p=false) => p ? `(${left(p)} ÷ ${right(p)})` : left() / right();
const num = (value) => (p=false) => p ? `${value}` : value; 

const tree = div(add(num(7),mul(sub(num(3),num(2)),num(5))),num(6));

assert.strictEqual("((7 + ((3 - 2) x 5)) ÷ 6)", tree(true));
assert.strictEqual(2, tree());


