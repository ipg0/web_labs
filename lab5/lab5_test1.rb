# frozen_string_literal: true

require 'minitest/autorun'
require './lab5_1'
EPS = 0.0000001

# Testing calculator
class Lab5Test1 < MiniTest::Test
  def test_calculator
    assert_in_epsilon(calculate_expression(1, 1, 1), 1.2750071995370522, EPS)
    assert_in_epsilon(calculate_expression(1, 2, 1), 1.6555285214851863, EPS)
    assert_in_epsilon(calculate_expression(1, 2, 3), 3.8467837076079340, EPS)
  end
end
