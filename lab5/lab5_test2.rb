
require './lab5_1'
EPS = 0.0000001

# Testing calculator
class Lab5Test1 < MiniTest::Test
  def test_calculator
    assert (calculate_expression(1, 1, 1) - 1.2750071995370522).abs < EPS
    assert (calculate_expression(1, 2, 1) - 1.6555285214851863).abs < EPS
    assert (calculate_expression(1, 2, 3) - 3.8467837076079340).abs < EPS
  end
end