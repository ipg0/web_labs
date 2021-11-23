# frozen_string_literal: true

require './lab6_3'

def generate_points(number)
  Array.new(number) do
    x = rand(-100.0..100.0)
    Point.new(x, yield(x))
  end
end

def test1
  generate_points(5) { |x| Math.cos(x) }.each.with_index do |point, index|
    puts "Test 1: Testing point [#{index}] (x: #{point.x}, y: #{point.y})"
    puts "Result: #{neibr(point) { |x| Math.cos(x) }}"
  end
end

def test2
  sin_sqr_func = ->(x) { Math.sin(x**2) }
  generate_points(5, &sin_sqr_func).each.with_index do |point, index|
    puts "Test 2: Testing point [#{index}] (x: #{point.x}, y: #{point.y})"
    puts "Result: #{neibr(point, &sin_sqr_func)}"
  end
end

def init_ui
  test1
  test2
end

init_ui
