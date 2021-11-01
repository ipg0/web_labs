# frozen_string_literal: true

require 'minitest/autorun'
require './lab6_1'

# Testing series calculation
class Lab6Test1 < MiniTest::Test
  def test_series
    [1e-2, 1e-3, 1e-4, 1e-5, 1e-6].each do |eps|
      assert (calculate_series(eps) - Math.log(2)).abs < eps
    end
  end
end
