# frozen_string_literal: true

Expr = Enumerator.new do |result|
  k = 1
  loop do
    result << (-1.0)**(k - 1) / k
    k += 1
  end
end

def approx(eps)
  Expr.take_while { |num| num.abs >= eps }.sum
end
