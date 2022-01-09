# frozen_string_literal: true

require 'minitest/autorun'
require './lab7_1'

DIR = '../.sandbox'
CHARS = ('a'..'z').to_a

# testing execution
class Lab7Test1 < MiniTest::Test
  def test_write
    write_file("#{DIR}/F", 'F test')
    write_file("#{DIR}/G", 'G test')
    assert File.read("#{DIR}/F") == 'F test'
    assert File.read("#{DIR}/G") == 'G test'
  end

  def validate_prefix_match(fstr, gstr, pref)
    pref.each_char.with_index do |char, index|
      assert char == fstr[index]
      assert char == gstr[index]
    end
  end

  def validate_prefix(fstr, gstr, pref)
    puts "F: #{fstr}, G: #{gstr}, H: #{pref}"
    validate_prefix_match(fstr, gstr, pref)
    assert pref.length == fstr.length ||
           pref.length == gstr.length ||
           fstr[pref.length] != gstr[pref.length]
  end

  def generate_random
    CHARS.sample(rand(10)).join
  end

  def generate_with_common_prefix
    pref = CHARS.sample(rand(10)).join
    [pref + generate_random, pref + generate_random]
  end

  def test_execute
    20.times do
      strs = generate_with_common_prefix
      execute(DIR) { |_| strs.pop }
      validate_prefix(
        File.read("#{DIR}/F"),
        File.read("#{DIR}/G"),
        File.read("#{DIR}/H")
      )
    end
  end
end
