# frozen_string_literal: true

$expr = Enumerator.new do |result|
  k = 1
  loop do
    result << (-1.0)**(k - 1) / k
    k += 1
  end
end

$expr.define_singleton_method(:approx) do |eps|
  take_while { |num| num.abs >= eps }.sum
end
