# frozen_string_literal: true

require 'minitest/autorun'
require './lab5_1'
require './lab5_2'

EPS = 0.0000001

# Testing calculator
class Lab5Test1 < MiniTest::Test
  def test_calculator
    assert (calculate_expression(1, 1, 1) - 1.2750071995370522).abs < EPS
    assert (calculate_expression(1, 2, 1) - 1.6555285214851863).abs < EPS
    assert (calculate_expression(1, 2, 3) - 3.8467837076079340).abs < EPS
  end
end

# Testing string corrector
class Lab5Test2 < MiniTest::Test
  def generate_random_strings
    arr = []
    10.times do
      str = ''
      5.times do
        str += "#{(0...5).map { ('a'..'z').to_a[rand(26)] }.join} "
      end
      arr << str
    end
    arr
  end

  def determ_correct(word, index)
    if index.odd?
      return 'replace ' if word[0].downcase == 'c'
      return '' if word[0].downcase == 'e'
    end
    "#{word} "
  end

  def generate_expected_output(arr)
    expected = []
    arr.each do |string|
      newstr = ''
      string.split.each.with_index do |word, index|
        newstr += determ_correct(word, index)
      end
      expected << newstr.rstrip
    end
    expected
  end

  def test_random_strings
    arr = generate_random_strings
    expected = generate_expected_output arr
    actual = correct_string_array(arr) do
      'replace'
    end
    assert_equal expected, actual
  end
end
