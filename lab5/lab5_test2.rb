# frozen_string_literal: true

require 'minitest/autorun'
require './lab5_2'

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
    arr.map do |string|
      string.split.map.with_index { |word, index| determ_correct(word, index) }.join.rstrip
    end
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
