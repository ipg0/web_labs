# frozen_string_literal: true

require 'minitest/autorun'
require './lab6_3'

def generate_points(number)
  Array.new(number) do
    x = rand(-100.0..100.0)
    Point.new(x, yield(x))
  end
end

# Testing neibr
class Lab6Test2 < MiniTest::Test
  def test_neibr_parabola
    generate_points(20) { |x| x**4 }.each do |point|
      assert neibr(point) { |x| x**4 }
    end
  end

  def test_neibr_cos
    generate_points(20) { |x| Math.cos(x) }.each do |point|
      assert neibr(point) { |x| Math.cos(x) }
    end
  end

  def test_neibr_cbrt
    generate_points(20) { |x| Math.cbrt(x) }.each do |point|
      assert neibr(point) { |x| Math.cbrt(x) }
    end
  end

  def test_neibr_comb
    func = ->(x) { Math.cbrt(Math.sin(x**4)) }
    generate_points(20, &func).each do |point|
      assert neibr(point, &func)
    end
  end
end
