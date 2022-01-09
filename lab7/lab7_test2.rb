# frozen_string_literal: true

require './lab7_2'
require 'minitest/autorun'

# House testing
class Lab7Test2 < MiniTest::Test
  def test_hierarchy
    assert ExtendedHouse.superclass == House
    assert ExtendedHouse.new(1, 1, 1).is_a? House
  end

  def test_cpsm
    assert ExtendedHouse.new(2010, 3200, 640_000_000)
                        .cost_per_square_meter == 200_000
  end
end
